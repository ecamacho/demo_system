defmodule ExampleSystemWeb.MathView do
  use ExampleSystemWeb, :view

  def render("sum.json", %{result: result}) do
    %{result: result}
  end

  def render("500.json", _assigns) do
    %{error: "unexpected error"}
  end

end
