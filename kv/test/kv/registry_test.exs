defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    ## Dùng start_supervised! để ExUnit đảm bảo rằng tiến trình
    ## registry sẽ bị tắt shutdown trước khi test tiếp theo bắt đầu.
    ## Đảm bảo rằng trạng thái của test hiện tại không ảnh hưởng
    ## đến test tiếp theo trong trường hợp chúng phụ thuộc vào các
    ## tài nguyên được chia sẻ.
    registry = start_supervised!(KV.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    name = "shopping"
    assert KV.Registry.lookup(registry, name) == :error

    KV.Registry.create(registry, name)
    assert {:ok, bucket} = KV.Registry.lookup(registry, name)

    key = "milk"
    value = 1
    KV.Bucket.put(bucket, key, value)
    assert KV.Bucket.get(bucket, key) == value
  end

  test "removes buckets on exit", %{registry: registry} do
    name = "shopping"
    KV.Registry.create(registry, name)
    {:ok, bucket} = KV.Registry.lookup(registry, name)
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, name) == :error
  end

  test "removes buckets on crash", %{registry: registry} do
    name = "shopping"
    KV.Registry.create(registry, name)
    {:ok, bucket} = KV.Registry.lookup(registry, name)

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)
    assert KV.Registry.lookup(registry, name) == :error
  end
end
