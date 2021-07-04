defmodule Assoc.Repo.Migrations.CreateTransactionsStatusType do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE transactions_status AS ENUM ('pending', 'approved', 'authorized', 'unauthorized', 'invalid', 'captured', 'canceled')"
    down_query = "DROP TYPE transactions_status"

    execute(up_query, down_query)
  end
end
