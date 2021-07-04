defmodule Assoc.Repo.Migrations.CreatePaymentsTable do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :decimal
      add :installments, :string
      add :credit_card_id, references(:credit_cards, type: :binary_id)

      timestamps()
    end
  end
end
