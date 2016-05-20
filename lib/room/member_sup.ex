defmodule Chat.MemberSup do
  use Supervisor

  def start_link(name) do
    Supervisor.start_link(__MODULE__, name, name: {:global, {:member_sup, name}})
  end

  def init(name) do
    children = [
      worker(Chat.Member, [])
    ]

    supervise(children, [strategy: :simple_one_for_one])
  end


  def start_member(room, member) do
    Supervisor.start_child(:global.whereis_name({:member_sup, room}), [room, member])
  end
end