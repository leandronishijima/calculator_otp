defmodule Calculator.Server do
  use GenServer
  alias Calculator.Core

  def start_link(initial) when is_integer(initial) do
    GenServer.start_link(__MODULE__, initial)
  end

  def init(number) do
    {:ok, number}
  end

  def handle_call({:add, number}, _from, state) do
    result = Core.add(state, number)
    {:reply, result, result}
  end

  def handle_call({:subtract, number}, _from, state) do
    result = Core.subtract(state, number)
    {:reply, result, result}
  end

  def handle_call({:multiply, number}, _from, state) do
    result = Core.multiply(state, number)
    {:reply, result, result}
  end

  def handle_call({:divide, number}, _from, state) do
    result = Core.divide(state, number)
    {:reply, result, result}
  end

  def handle_call(:negate, _from, state) do
    result = Core.negate(state)
    {:reply, result, result}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:clear, _state) do
    {:reply, 0, 0}
  end

  def handle_info(:inc, state) do
    new_state = Core.inc(state)
    {:noreply, new_state}
  end

  def add(pid, number), do: GenServer.call(pid, {:add, number})
  def subtract(pid, number), do: GenServer.call(pid, {:subtract, number})
  def multiply(pid, number), do: GenServer.call(pid, {:multiply, number})
  def divide(pid, number), do: GenServer.call(pid, {:divide, number})
  def negate(pid), do: GenServer.call(pid, :negate)
  def inc(pid), do: send(pid, :inc)
  def clear(pid), do: GenServer.call(pid, :clear)

  def state(pid) do
    GenServer.call(pid, :state)
  end
end
