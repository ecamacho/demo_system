defmodule ExampleSystemWeb.MathController do
 use ExampleSystemWeb, :controller

 def sum(conn, %{"input" => input}) do
    # sum = ExampleSystem.Math.calc_sum(input)
    # sum = Task.async(fn -> ExampleSystem.Math.calc_sum(input) end)
    # |> Task.await()
    {:ok, pid} = Task.Supervisor.start_link()
    a = Task.Supervisor.async_nolink(pid, ExampleSystem.Math, :calc_sum, [input])
    case Task.yield(a) do
      {:ok, sum} -> render(conn, "sum.json", %{result: sum})
      _ -> render(conn, "500.json")
    end


 end

end
