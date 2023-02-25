defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias RealDealApiWeb.Auth.Guardian

  def init(_options) do
  end

  def call(conn, _options) do
    if conn.assigns[:account] do
      conn
    else
      token = Guardian.Plug.current_token(conn)
      {:ok, account} = Guardian.current_account(token)

      cond do
        account -> assign(conn, :account, account)
        true -> assign(conn, :account, nil)
      end
    end
  end
end
