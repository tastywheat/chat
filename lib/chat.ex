defmodule Chat do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Chat.RoomSup, []),
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end


  def create_room(room_name) do
    Chat.RoomSup.start_room(room_name)
  end

  def join_room(room_name, member_name) do
    Chat.MemberSup.start_member(room_name, member_name)
  end
end
