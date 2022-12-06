defmodule RealDealApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :hash_password, :string

      timestamps()
    end

    create unique_index(:accounts, [:email])

  end
end
