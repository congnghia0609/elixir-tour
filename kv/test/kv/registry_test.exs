defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    ## Dùng start_supervised! để ExUnit đảm bảo rằng tiến trình
    ## registry sẽ bị tắt shutdown trước khi test tiếp theo bắt đầu.
    ## Đảm bảo rằng trạng thái của test hiện tại không ảnh hưởng
    ## đến test tiếp theo trong trường hợp chúng phụ thuộc vào các
    ## tài nguyên được chia sẻ.
    # registry = start_supervised!(KV.Registry)
    # %{registry: registry}
    _ = start_supervised!(KV.Registry, name: context.test)
    %{registry: context.test}
  end

  test "spawns buckets", %{registry: registry} do
    # name = "shopping"
    assert KV.Registry.lookup(registry, "shopping") == :error

    KV.Registry.create(registry, "shopping")
    assert {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    key = "milk"
    value = 1
    KV.Bucket.put(bucket, key, value)
    assert KV.Bucket.get(bucket, key) == value
  end

  # test "removes buckets on exit", %{registry: registry} do
  #   # name = "shopping"
  #   KV.Registry.create(registry, "shopping")
  #   {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
  #   Agent.stop(bucket)

  #   # Do a call to ensure the registry processed the DOWN message
  #   _ = KV.Registry.create(registry, "bogus")
  #   assert KV.Registry.lookup(registry, "shopping") == :error
  # end

  # test "removes buckets on crash", %{registry: registry} do
  #   # name = "shopping"
  #   KV.Registry.create(registry, "shopping")
  #   {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

  #   # Stop the bucket with non-normal reason
  #   Agent.stop(bucket, :shutdown)

  #   # Do a call to ensure the registry processed the DOWN message
  #   _ = KV.Registry.create(registry, "bogus")
  #   assert KV.Registry.lookup(registry, "shopping") == :error
  # end
end
