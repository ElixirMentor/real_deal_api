defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text conn, "The Real Deal API is LIVE - #{Mix.env()}"
  end

end
