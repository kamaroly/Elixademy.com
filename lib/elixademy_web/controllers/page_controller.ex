defmodule ElixademyWeb.PageController do
  use ElixademyWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
