defmodule Assoc.Repo.Migrations.CreateTransactionsTable do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :tid, :string
      add :status, :transactions_status, default: "pending"
      add :credit_card_id, references(:credit_cards, type: :binary_id)

      timestamps()
    end

    create unique_index(:transactions, [:tid])
  end
end
