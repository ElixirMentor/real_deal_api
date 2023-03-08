# defmodule RealDealApiWeb.Auth.AuthorizedPlug do
#   alias RealDealApiWeb.Auth.ErrorResponse

#   def is_authorized(%{params: %{"account" => params}} = conn, _opts) do
#     if conn.assigns.account.id == params["id"] do
#       conn
#     else
#       raise ErrorResponse.Forbidden
#     end
#   end

#   def is_authorized(%{params: %{"user" => params}} = conn, _opts) do
#     if conn.assigns.account.user.id == params["id"] do
#       conn
#     else
#       raise ErrorResponse.Forbidden
#     end
#   end
# end

defmodule RealDealApiWeb.Auth.AuthorizedPlug do
  alias RealDealApiWeb.Auth.ErrorResponse

  def is_authorized(conn, opts) do
    case opts[:resource] do
      :account ->
        check_account(conn)

      :user ->
        check_user(conn)

      _ ->
        raise ArgumentError, "Invalid resource"
    end
  end

  defp check_account(conn) do
    account = get_param(conn, "account")

    if conn.assigns.account.id == account["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  defp check_user(conn) do
    user = get_param(conn, "user")

    if conn.assigns.account.user.id == user["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  defp get_param(conn, key) do
    conn.params[key]
  end
end
