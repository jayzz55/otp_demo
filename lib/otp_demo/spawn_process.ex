# 1. Spawning process

Enum.map(1..100_000, fn(x) -> spawn(fn -> :timer.sleep(3000); IO.puts("Process #{x} is done!") end) end)

# 2. Sending messages

receiver = spawn(fn -> receive do
  {:hello, msg} -> IO.puts "Received #{msg}"
end end)

Process.alive?(receiver)

sender = spawn(fn -> send(receiver, {:hello, 'aloha'}) end)

Process.alive?(sender)
Process.alive?(receiver)

main_pid = self()
sender = spawn(fn -> send(main_pid, {:hello, 'aloha'}) end)

# flush()
