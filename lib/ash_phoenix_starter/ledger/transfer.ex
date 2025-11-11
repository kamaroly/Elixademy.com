defmodule Stevia.Ledger.Transfer do
  use Ash.Resource,
    domain: Elixir.Stevia.Ledger,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshDoubleEntry.Transfer],
    authorizers: [Ash.Policy.Authorizer]

  transfer do
    account_resource Stevia.Ledger.Account
    balance_resource Stevia.Ledger.Balance
  end

  postgres do
    table "ledger_transfers"
    repo Stevia.Repo
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
      authorize_if Stevia.Accounts.Checks.Authorize
    end
  end

  preparations do
    prepare Stevia.Preparations.SetTenant
  end

  changes do
    change Stevia.Changes.SetTenant
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
    belongs_to :from_account, Stevia.Ledger.Account do
      attribute_writable? true
    end

    belongs_to :to_account, Stevia.Ledger.Account do
      attribute_writable? true
    end

    has_many :balances, Stevia.Ledger.Balance
  end
end
