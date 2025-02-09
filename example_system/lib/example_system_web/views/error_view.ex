defmodule ExampleSystemWeb.ErrorView do
  use ExampleSystemWeb.Base.View

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("500.json", _assigns) do
    %{"error": "unexpected error"}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    IO.puts "template_not_found"
    render("500.html", assigns)
  end
end
