defmodule KV.Registry do
  use GenServer

  ## Client API

  @doc """
  Start the registry.
  """
  def start_link(otps) do
    GenServer.start_link(__MODULE__, :ok, otps)
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
    {:ok, %{}} # {:ok, state} state là map.
  end

  ## Đây là hàm đồng bộ synchronous (hậu tố _call),
  ## client phải chờ server phản hồi response.
  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names} # format {:reply, reply, new_state}
  end

  ## Đây là hàm bất đồng bộ asynchronous (hậu tố _cast).
  ## Server không gửi response nên client không phải đợi.
  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names} # format {:noreply, new_state}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      {:noreply, Map.put(names, name, bucket)} # format {:noreply, new_state}
    end
  end

end
