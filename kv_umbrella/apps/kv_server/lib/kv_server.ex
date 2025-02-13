defmodule KVServer do
  @moduledoc """
  Documentation for `KVServer`.

  A TCP server, in broad strokes, performs the following steps:
  - Listens to a port until the port is available and it gets hold of the socket
  - Waits for a client connection on that port and accepts it
  - Reads the client request and writes a response back
  """

  require Logger

  def accept(port) do
    # The options below mean:
    #
    # 1. `:binary` - receives data as binaries (instead of lists)
    # 2. `packet: :line` - receives data line by line
    # 3. `active: false` - blocks on `:gen_tcp.recv/2` until data is available
    # 4. `reuseaddr: true` - allows us to reuse the address if the listener crashes
    #
    {:ok, socket} =
      :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    # serve(client)
    ## Dùng Task để có thể xử lý nhiều client đồng thời.
    # Task.start_link(fn -> serve(client) end)
    ## Dùng TaskSupervisor để phục hồi các tiến trình Task bị chết,
    ## tăng khả năng chịu lỗi của hệ thống.
    {:ok, pid} = Task.Supervisor.start_child(KVServer.TaskSupervisor, fn -> serve(client) end)
    :ok = :gen_tcp.controlling_process(client, pid)

    loop_acceptor(socket)
  end

  defp serve(socket) do
    # socket
    # |> read_line()
    # |> write_line(socket)

    # msg =
    #   case read_line(socket) do
    #     {:ok, data} ->
    #       case KVServer.Command.parse(data) do
    #         {:ok, command} ->
    #           KVServer.Command.run(command)
    #         {:error, _} = err ->
    #           err
    #       end
    #     {:error, _} = err ->
    #       err
    #   end

    msg =
      with {:ok, data} <- read_line(socket),
        {:ok, command} <- KVServer.Command.parse(data),
        do: KVServer.Command.run(command)

    write_line(socket, msg)
    serve(socket)
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
  end

  defp write_line(socket, {:ok, text}) do
    :gen_tcp.send(socket, text)
  end

  defp write_line(socket, {:error, :unknown_command}) do
    # Known error; write to the client
    :gen_tcp.send(socket, "UNKNOWN COMMAND\r\n")
  end

  defp write_line(socket, {:error, :not_found}) do
    :gen_tcp.send(socket, "NOT FOUND\r\n")
  end

  defp write_line(_socket, {:error, :close}) do
    # The connection was closed, exit politely
    exit(:shutdown)
  end

  defp write_line(socket, {:error, error}) do
    # Unknown error; write to the client and exit
    :gen_tcp.send(socket, "ERROR\r\n")
    exit(error)
  end
end
