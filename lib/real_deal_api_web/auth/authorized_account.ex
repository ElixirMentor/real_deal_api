defmodule RealDealApiWeb.Auth.AuthorizedAccount do
  alias RealDealApiWeb.{Auth.Guardian, Auth.ErrorResponse}

  def is_authorized_account(conn, _opts) do
    token = Guardian.Plug.current_token(conn)
    account_id = Guardian.account_id_by_token(token)

    if conn.assigns.account.id == account_id do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end
end
