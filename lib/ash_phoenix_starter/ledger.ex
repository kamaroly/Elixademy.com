defmodule Stevia.Ledger do
  use Ash.Domain,
    otp_app: :AshPhoenixStarter

  resources do
    resource Stevia.Ledger.Account
    resource Stevia.Ledger.Balance
    resource Stevia.Ledger.Transfer
  end
end
