defmodule RealDealApiWeb.AccountView do
  use RealDealApiWeb, :view
  alias RealDealApiWeb.AccountView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end
end
