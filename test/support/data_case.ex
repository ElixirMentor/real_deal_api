defmodule RealDealApi.Support.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import RealDealApi.Support.DataCase
      alias RealDealApi.{Support.Factory, Repo}
    end
  end

  setup _ do
    Ecto.Adapters.SQL.Sandbox.mode(RealDealApi.Repo, :manual)
  end
end
