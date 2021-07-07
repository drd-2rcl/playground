defmodule Assoc.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Assoc.{CreditCard, Transaction}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields [
    :amount,
    :installments,
    :credit_card_id,
    :transaction_id
  ]

  schema "payments" do
    field :amount, :decimal
    field :installments, :string

    belongs_to :credit_cards, CreditCard, foreign_key: :credit_card_id
    belongs_to :transactions, Transaction, foreign_key: :transaction_id

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
