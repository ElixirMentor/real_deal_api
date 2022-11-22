defmodule RealDealApi.Repo do
  use Ecto.Repo,
    otp_app: :real_deal_api,
    adapter: Ecto.Adapters.Postgres
end
