alias Assoc.{CreditCard, Payment, Repo, Transaction}

# CreditCard
params = %{card_number: "1234567890"}
params |> CreditCard.changeset() |> Repo.insert()
Repo.all(CreditCard) |> Repo.preload(:transactions)
Repo.all(CreditCard) |> Repo.preload(:payments)

# Transaction
params = %{credit_card_id:  "709481ac-4e88-4825-9196-1fada13cb2e9"}
params |> Transaction.changeset() |> Repo.insert()
Repo.all(Transaction) |> Repo.preload(:credit_cards)
Repo.all(Transaction) |> Repo.preload(:payments)

# Payments
params = %{
  amount: 100,
  installments: "1",
  credit_card_id: "709481ac-4e88-4825-9196-1fada13cb2e9",
  transaction_id: "9de6030a-cb3c-4a8b-9c58-1e2995a462df"
}
params |> Payment.changeset() |> Repo.insert()
Repo.all(Payment) |> Repo.preload(:credit_cards)
Repo.all(Payment) |> Repo.preload(:transactions)
