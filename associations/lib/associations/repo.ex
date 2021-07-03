defmodule Associations.Repo do
  use Ecto.Repo,
    otp_app: :associations,
    adapter: Ecto.Adapters.Postgres
end
