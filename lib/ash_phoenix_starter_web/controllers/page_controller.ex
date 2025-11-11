defmodule SteviaWeb.PageController do
  use SteviaWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
