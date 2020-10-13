defmodule OtpDemo do
  use Application

  def start(_type, _args) do
    IO.puts "Starting the application..."
    OtpDemo.Supervisor.start_link()
  end
end
