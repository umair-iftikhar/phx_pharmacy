defmodule PhxPharmacyWeb.PageController do
  use PhxPharmacyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
