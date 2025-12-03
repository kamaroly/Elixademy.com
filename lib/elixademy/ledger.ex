defmodule Elixademy.Ledger do
  use Ash.Domain,
    otp_app: :Elixademy

  resources do
    resource Elixademy.Ledger.Account
    resource Elixademy.Ledger.Balance
    resource Elixademy.Ledger.Transfer
  end
end
