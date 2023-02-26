defmodule RealDealApiWeb.UserView do
  use RealDealApiWeb, :view
  alias RealDealApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      full_name: user.full_name,
      gender: user.gender,
      biography: user.biography
    }
  end
end
