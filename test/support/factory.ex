defmodule RealDealApi.Support.Factory do
  use ExMachina.Ecto, repo: RealDealApi.Repo
  alias RealDealApi.Accounts.Account

  def account_factory do
    %Account{
      email: Faker.Internet.email(),
      hash_password: Faker.Internet.slug()
    }
  end
end
