defmodule OtpDemo.Bomb do
  def explode, do: exit(:kaboom)
end
