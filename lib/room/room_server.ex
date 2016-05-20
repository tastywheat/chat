defmodule Chat.RoomServer do
    use GenServer

    def start_link(name) do
        GenServer.start_link(__MODULE__, [], name: {:global, {:room_server, name}})
    end

    def init(opts) do
        IO.puts "starting roomserver"
        {:ok, %{}}
    end

    def handle_call(:get_state, _from, state) do
        {:reply, state, state}
    end
end