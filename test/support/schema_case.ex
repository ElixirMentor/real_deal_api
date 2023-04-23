defmodule RealDealApi.Support.SchemaCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import RealDealApi.Support.SchemaCase
    end
  end

  setup _ do
    Ecto.Adapters.SQL.Sandbox.mode(RealDealApi.Repo, :manual)
  end

  def valid_params(fields_with_types) do
    valid_value_by_type = %{
      binary_id: fn -> Faker.UUID.v4() end,
      string: fn -> Faker.Lorem.word() end,
      naive_datetime: fn ->
        Faker.NaiveDateTime.backward(Enum.random(0..100))
        |> NaiveDateTime.truncate(:second)
      end
    }

    for {field, type} <- fields_with_types, into: %{} do
      case field do
        :email -> {Atom.to_string(field), Faker.Internet.email()}
        _ -> {Atom.to_string(field), valid_value_by_type[type].()}
      end
    end
  end

  def invalid_params(fields_with_types) do
    invalid_value_by_type = %{
      binary_id: fn -> DateTime.utc_now() end,
      string: fn -> DateTime.utc_now() end,
      naive_datetime: fn -> Faker.Lorem.word() end
    }

    for {field, type} <- fields_with_types, into: %{} do
      {Atom.to_string(field), invalid_value_by_type[type].()}
    end
  end
end
