defmodule Stevia.Farms.InputApplication do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farm_input_applications"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :application_date, :date do
      allow_nil? false
      description "The date when the input was applied."
    end

    attribute :quantity_used, :float do
      allow_nil? false
      description "The quantity of input used."
    end

    attribute :cost, :decimal do
      allow_nil? true
      description "The cost of the input application."
    end

    timestamps()
  end

  relationships do
    belongs_to :planting, Stevia.Farms.Planting
    belongs_to :input_type, Stevia.Farms.InputType
  end
end
