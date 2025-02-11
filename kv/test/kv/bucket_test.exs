defmodule KV.BucketTest do
  @moduledoc """
  Run test by: mix test
  """
  use ExUnit.Case, async: true

  # macro setup định nghĩa lệnh callback được chạy trước mỗi lần test,
  # theo cùng tiến trình với test đó.
  setup do
    {:ok, bucket} = KV.Bucket.start_link([]) # bucket is PID
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    # `bucket` is now the bucket from the setup block
    key = "milk"
    value = 3
    assert KV.Bucket.get(bucket, key) == nil

    KV.Bucket.put(bucket, key, value)
    assert KV.Bucket.get(bucket, key) == value
  end

  test "remove key-value from map", %{bucket: bucket} do
    key = "milk"
    value = 3
    KV.Bucket.put(bucket, key, value)
    assert KV.Bucket.get(bucket, key) == value

    KV.Bucket.delete(bucket, key)
    assert KV.Bucket.get(bucket, key) == nil
  end
end
