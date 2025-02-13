defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      ## BucketSupervisor phải được khởi động trước Registry.
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one},
      ## supervisor sẽ start KV.Registry bằng cách gọi hàm
      ## KV.Registry.start_link(name: KV.Registry)
      {KV.Registry, name: KV.Registry},
      {Task.Supervisor, name: KV.RouterTasks}
    ]

    ## strategy: :one_for_one nếu 1 child process bị chết
    ## thì chỉ 1 cái được khởi động lại.
    ## strategy: :one_for_all ==> Supervisor sẽ tắt và khởi
    ## động lại tất cả các tiến trình con bất cứ khi nào 1
    ## trong số chúng chết.
    ## Supervisor sẽ gọi `child_spec/1` của các process con.
    ## Ex: %{id: KV.Registry, start: {KV.Registry, :start_link, [[]]}}
    ## `child_spec/1` tự động được định nghĩa khi process sử
    ## dụng `use Agent`, `use GenServer`, `use Supervisor`.
    Supervisor.init(children, strategy: :one_for_all)
  end
end
