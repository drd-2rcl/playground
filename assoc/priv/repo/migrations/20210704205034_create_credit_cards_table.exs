defmodule Assoc.Repo.Migrations.CreateCreditCardsTable do
  use Ecto.Migration

  def change do
    create table(:credit_cards) do
      add :card_number, :string

      timestamps()
    end

    create unique_index(:credit_cards, [:card_number])
  end
end
