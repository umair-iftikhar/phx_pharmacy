defmodule PhxPharmacy.Repo do
  use Ecto.Repo,
    otp_app: :phx_pharmacy,
    adapter: Ecto.Adapters.Postgres
end
