defmodule RealDealApiWeb.Router do
  use RealDealApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RealDealApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create
  end
end
