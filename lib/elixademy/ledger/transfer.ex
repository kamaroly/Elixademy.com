defmodule Elixademy.Ledger.Transfer do
  use Ash.Resource,
    domain: Elixir.Elixademy.Ledger,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshDoubleEntry.Transfer],
    authorizers: [Ash.Policy.Authorizer]

  transfer do
    account_resource Elixademy.Ledger.Account
    balance_resource Elixademy.Ledger.Balance
  end

  postgres do
    table "ledger_transfers"
    repo Elixademy.Repo
  end

  actions do
    defaults [:read]

    create :transfer do
      accept [:amount, :timestamp, :from_account_id, :to_account_id]
    end
  end

  policies do
    policy always() do
      access_type :strict
      authorize_if Elixademy.Accounts.Checks.Authorize
    end
  end

  preparations do
    prepare Elixademy.Preparations.SetTenant
  end

  changes do
    change Elixademy.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end

  attributes do
    attribute :id, AshDoubleEntry.ULID do
      primary_key? true
      allow_nil? false
      default &AshDoubleEntry.ULID.generate/0
    end

    attribute :amount, :money do
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    belongs_to :from_account, Elixademy.Ledger.Account do
      attribute_writable? true
    end

    belongs_to :to_account, Elixademy.Ledger.Account do
      attribute_writable? true
    end

    has_many :balances, Elixademy.Ledger.Balance
  end
end
