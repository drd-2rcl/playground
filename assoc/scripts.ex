alias Assoc.{CreditCard, Payment, Repo, Transaction}

# CreditCard
params = %{card_number: "1234567890"}
params |> CreditCard.changeset() |> Repo.insert()
Repo.all(CreditCard) |> Repo.preload(:transactions)
Repo.all(CreditCard) |> Repo.preload(:payments)

# Transaction
params = %{credit_card_id: "12a75617-7ca4-4d2c-a8e8-907bf89086fb"}
params |> Transaction.changeset() |> Repo.insert()
Repo.all(Transaction) |> Repo.preload(:credit_cards)

# Payments
params = %{
  amount: 100,
  installments: "1",
  credit_card_id: "12a75617-7ca4-4d2c-a8e8-907bf89086fb"
}
params |> Payment.changeset() |> Repo.insert()
Repo.all(Payment) |> Repo.preload(:credit_cards)
