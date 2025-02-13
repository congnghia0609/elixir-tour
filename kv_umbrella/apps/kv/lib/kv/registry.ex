defmodule KV.Registry do
  use GenServer

  ## Client API

  @doc """
  Start the registry with the given options.

  `:name` is always required.
  """
  def start_link(opts) do
    # 1. Pass the name to GenServer's init
    server = Keyword.fetch!(opts, :name)
    GenServer.start_link(__MODULE__, server, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Return `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, name) do
    # 2. Lookup is new done directly in ETS, without accessing the server
    case :ets.lookup(server, name) do
      [{^name, pid}] -> {:ok, pid}
      [] -> :error
    end
    # GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def create(server, name) do
    ## Dùng call thay vì cast để đồng bộ hóa việc
    ## client đợi create xong rồi mới được thực hiện
    ## các hành động khác.
    # GenServer.cast(server, {:create, name})
    GenServer.call(server, {:create, name})
  end



  ## Server Callbacks

  @impl true
  def init(table) do
    # 3. We have replace the names map by the ETS table
    # names = %{} # name -> pid
    names = :ets.new(table, [:named_table, read_concurrency: true])
    ## Dùng để monitoring Agent để lắng nghe sự kiện :DOWN
    ## khi Agent bị chết
    ## {:DOWN, #Reference<0.0.0.551>, :process, #PID<0.66.0>, :normal}
    refs = %{} # ref -> name
    {:ok, {names, refs}} # {:ok, state} state là 1 tuple chứa 2 map.
  end

  ## 4. The previous handle_call callback for lookup was removed
  ## Đây là hàm đồng bộ synchronous (hậu tố _call),
  ## client phải chờ server phản hồi response.
  # @impl true
  # def handle_call({:lookup, name}, _from, state) do
  #   {names, _} = state
  #   {:reply, Map.fetch(names, name), state} # format {:reply, reply, new_state}
  # end
  @impl true
  def handle_call({:create, name}, _from, {names, refs}) do
    # 5. Read and write to the ETS table instead of the map
    case lookup(names, name) do
      {:ok, pid} ->
        {:reply, pid, {names, refs}} # format {:reply, reply, new_state}
      :error ->
        {:ok, pid} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
        ref = Process.monitor(pid)
        refs = Map.put(refs, ref, name)
        :ets.insert(names, {name, pid})
        {:reply, pid, {names, refs}} # format {:reply, reply, new_state}
    end
  end

  ## Đây là hàm bất đồng bộ asynchronous (hậu tố _cast).
  ## Server không gửi response nên client không phải đợi.
  ## Dùng khi Client không quan tâm đến phản hồi.
  # @impl true
  # def handle_cast({:create, name}, {names, refs}) do
  #   # 5. Read and write to the ETS table instead of the map
  #   case lookup(names, name) do
  #     {:ok, _pid} ->
  #       {:noreply, {names, refs}}
  #     :error ->
  #       {:ok, pid} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
  #       ref = Process.monitor(pid)
  #       refs = Map.put(refs, ref, name)
  #       :ets.insert(names, {name, pid})
  #       {:noreply, {names, refs}} # format {:noreply, new_state}
  #   end
  #   # if Map.has_key?(names, name) do
  #   #   {:noreply, {names, refs}} # format {:noreply, new_state}
  #   # else
  #   #   # {:ok, bucket} = KV.Bucket.start_link([])
  #   #   # ref = Process.monitor(bucket)
  #   #   # refs = Map.put(refs, ref, name)
  #   #   # names = Map.put(names, name, bucket)
  #   #   {:ok, pid} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
  #   #   ref = Process.monitor(pid)
  #   #   refs = Map.put(refs, ref, name)
  #   #   names = Map.put(names, name, pid)
  #   #   {:noreply, {names, refs}} # format {:noreply, new_state}
  #   # end
  # end

  @impl true
  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    # 6. Delete from the ETS table instead of the map
    {name, refs} = Map.pop(refs, ref)
    # names = Map.delete(names, name)
    :ets.delete(names, name)
    {:noreply, {names, refs}}
  end

  ## Hàm này xử lý tất cả các message được gửi thông qua cơ chế `send/2`.
  @impl true
  def handle_info(msg, state) do
    require Logger
    Logger.debug("Unexpected message in KV.Registry: #{inspect(msg)}")
    {:noreply, state}
  end
end
