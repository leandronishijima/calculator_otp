defmodule SuperDuper do
  @moduledoc """
  Documentation for `SuperDuper`.
  """

  def die(server), do: GenServer.cast(server, :die)
  def say(server), do: GenServer.call(server, :say)
end
