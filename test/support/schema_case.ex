defmodule RealDealApi.Support.SchemaCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import RealDealApi.Support.SchemaCase
    end
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
end
