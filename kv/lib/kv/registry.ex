defmodule KV.Registry do
  use GenServer

  ## Client API

  @doc """
  Start the registry.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Return `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end



  ## Defining GenServer Callbacks

  @impl true
  def init(:ok) do
    names = %{} # name -> pid
    ## Dùng để monitoring Agent để lắng nghe sự kiện :DOWN
    ## khi Agent bị chết
    ## {:DOWN, #Reference<0.0.0.551>, :process, #PID<0.66.0>, :normal}
    refs = %{} # ref -> name
    {:ok, {names, refs}} # {:ok, state} state là 1 tuple chứa 2 map.
  end

  ## Đây là hàm đồng bộ synchronous (hậu tố _call),
  ## client phải chờ server phản hồi response.
  @impl true
  def handle_call({:lookup, name}, _from, state) do
    {names, _} = state
    {:reply, Map.fetch(names, name), state} # format {:reply, reply, new_state}
  end

  ## Đây là hàm bất đồng bộ asynchronous (hậu tố _cast).
  ## Server không gửi response nên client không phải đợi.
  ## Dùng khi Client không quan tâm đến phản hồi.
  @impl true
  def handle_cast({:create, name}, {names, refs}) do
    if Map.has_key?(names, name) do
      {:noreply, {names, refs}} # format {:noreply, new_state}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      ref = Process.monitor(bucket)
      refs = Map.put(refs, ref, name)
      names = Map.put(names, name, bucket)
      {:noreply, {names, refs}} # format {:noreply, new_state}
    end
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    {name, refs} = Map.pop(refs, ref)
    names = Map.delete(names, name)
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
