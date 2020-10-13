defmodule OtpDemoTest do
  use ExUnit.Case
  doctest OtpDemo

  test "greets the world" do
    assert OtpDemo.hello() == :world
  end
end
