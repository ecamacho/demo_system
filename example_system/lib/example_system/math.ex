defmodule ExampleSystem.Math do
  def child_spec(_), do: Supervisor.child_spec(Task.Supervisor.child_spec(name: __MODULE__), id: __MODULE__)

  def sum(number) do
    caller = self()

    with {:ok, pid} <-
           Task.Supervisor.start_child(
             __MODULE__,
             fn ->
              send(caller, {:sum, self(), calc_sum(number)}) end
           ) do
      Process.monitor(pid)
      {:ok, pid}
    end
  end

  def calc_sum(13), do: raise("error")
  def calc_sum(n), do: calc_sum(1, n, 0)

  def calc_sum(from, from, sum), do: sum + from
  def calc_sum(from, to, acc_sum), do: calc_sum(from + 1, to, acc_sum + from)
end
