defmodule Chat.Member do
    use GenServer

    def start_link(room, member) do
        IO.puts "start_link room.member"
        GenServer.start_link(__MODULE__, [], name: {:global, {:room, room, :member, member}})
    end

    def init([]) do
        IO.puts "starting member"
        {:ok, 3}
    end

    def handle_call(:get_state, _from, state) do
        {:reply, state, state}
    end
end