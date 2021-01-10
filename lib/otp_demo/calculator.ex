defmodule OtpDemo.Calculator do
  def square_root(number) do
    number * number
  end

  def add(number1, number2) do
    number1 + number2
  end

  def ask_square_root(sender, number) do
    send sender, {:ok, self(), square_root(number) }
  end

  def ask_add(sender, number1, number2) do
    send sender, {:ok, self(), add(number1, number2) }
  end
end
# Enum.map(1..200_000, fn(x) -> spawn(fn -> IO.puts OtpDemo.Calculator.square_root(x) end) end)
