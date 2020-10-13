defmodule OtpDemo.StackGenServer do
  use GenServer

  ### GenServer API

  @doc """
  GenServer.init/1 callback
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  """
  def handle_call(:pop, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:pop, _from, []), do: {:reply, nil, []}

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  def handle_call({:push, item}, _from, state), do: {:reply, [item|state], [item | state]}

  ### Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def push(item), do: GenServer.call(__MODULE__, {:push, item})
  def pop, do: GenServer.call(__MODULE__, :pop)
end
