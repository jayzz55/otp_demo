defmodule OtpDemo.Student do
  alias OtpDemo.Calculator

  def calculate(a, b) do
    # a^2 + b^2

    pid1 = spawn(Calculator, :ask_square_root, [self(), a])
    pid2 = spawn(Calculator, :ask_square_root, [self(), b])

    square_root_a = receive do {:ok, ^pid1, result} -> result end
    square_root_b = receive do {:ok, ^pid2, result} -> result end

    pid3 = spawn(Calculator, :ask_add, [self(), square_root_a, square_root_b])
    receive do {:ok, ^pid3, result} -> result end
  end
end
# Enum.map(1..200_000, fn(x) -> spawn(fn -> IO.puts OtpDemo.Student.calculate(x,x) end) end)
