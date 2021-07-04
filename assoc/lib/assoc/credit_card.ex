defmodule Assoc.CreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias Assoc.{Payment, Transaction}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "credit_cards" do
    field :card_number, :string

    has_many :transactions, Transaction
    has_many :payments, Payment

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:card_number])
    |> validate_required([:card_number])
    |> cast_assoc(:transactions)
    |> cast_assoc(:payments)
  end
end
