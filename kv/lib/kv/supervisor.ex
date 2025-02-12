defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      ## supervisor sẽ start KV.Registry bằng cách gọi hàm
      ## KV.Registry.start_link(name: KV.Registry)
      {KV.Registry, name: KV.Registry}
    ]

    ## strategy: :one_for_one nếu 1 child process bị chết
    ## thì chỉ 1 cái được khởi động lại.
    ## Supervisor sẽ gọi `child_spec/1` của các process con.
    ## Ex: %{id: KV.Registry, start: {KV.Registry, :start_link, [[]]}}
    ## `child_spec/1` tự động được định nghĩa khi process sử
    ## dụng `use Agent`, `use GenServer`, `use Supervisor`.
    Supervisor.init(children, strategy: :one_for_one)
  end
end
