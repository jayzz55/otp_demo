defmodule OtpDemo.Stack do
  def start(initial_state) do
    pid = spawn(__MODULE__, :listen, [initial_state])
    Process.register(pid, __MODULE__)
    pid
  end

  def listen(state) do
    receive do
      {sender, :queue}      -> handle_queue(sender, state)
      {sender, :pop}         -> handle_pop(sender, state)
      {_sender, :push, item} -> listen([item|state])
    end
  end

  def handle_queue(sender, state) do
    send sender, state
    listen state
  end

  def handle_pop(sender, []) do
    send sender, nil
    listen []
  end

  def handle_pop(sender, state) do
    send sender, hd(state)
    listen tl(state)
  end

  # Client API
  def queue do
    send __MODULE__, {self(), :queue}
    receive do result -> result end
  end

  def push(item) do
    send __MODULE__, {self(), :push, item}
  end

  def pop do
    send __MODULE__, {self(), :pop}
    receive do result -> result end
  end
end
