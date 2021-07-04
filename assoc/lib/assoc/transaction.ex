defmodule Assoc.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  alias Assoc.CreditCard

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields [:tid, :credit_card_id]
  @cct_status [
    :pending,
    :approved,
    :authorized,
    :unauthorized,
    :invalid,
    :captured,
    :canceled
  ]

  schema "transactions" do
    field :tid, :string
    field :status, Ecto.Enum, values: @cct_status

    belongs_to :credit_cards, CreditCard, foreign_key: :credit_card_id

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> case do
      %{valid?: false, changes: changes} = changeset when changes == %{} ->
        %{changeset | action: :ignore}
      changeset -> changeset
    end
  end
end
