defmodule KV do
  @moduledoc """
  Documentation for `KV`.
  """

  use Application

  ## Để khởi chạy Application với shell ta dùng: iex -S mix
  @impl true
  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    KV.Supervisor.start_link(name: KV.Supervisor)
  end

  # @doc """
  # Hello world.

  # ## Examples

  #     iex> KV.hello()
  #     :world

  # """
  # def hello do
  #   :world
  # end
end
