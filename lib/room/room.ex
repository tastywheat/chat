defmodule Chat.Room do
  use Supervisor

  def start_link(name) do
    Supervisor.start_link(__MODULE__, name, name: {:global, {:room, name}})
  end

  def init(name) do
    IO.puts "starting room #{name}"
    children = [
      worker(Chat.RoomServer, [name]),
      supervisor(Chat.MemberSup, [name])
    ]

    supervise(children, strategy: :one_for_one)
  end
end