defmodule RealDealApiWeb.Auth.AuthorizedAccount do
  alias RealDealApiWeb.{Auth.ErrorResponse}

  def is_authorized_account(%{params: %{"account" => params}} = conn, _opts) do
    if conn.assigns.account.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  def is_authorized_account(%{params: %{"user" => params}} = conn, _opts) do
    if conn.assigns.account.user.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end
end
