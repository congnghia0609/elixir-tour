
defmodule KV.Bucket do
  ## `restart: :temporary` để tránh bị rò rỉ bộ nhớ khi Bucket bị chết,
  ## thì supervisor chỉ cần thay thế bằng cái mới, mà
  ## không cần phải khởi động lại cái cũ.
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket.
  """
  def start_link(_otps) do
    Agent.start_link(fn  -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Returns the current value of the `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
