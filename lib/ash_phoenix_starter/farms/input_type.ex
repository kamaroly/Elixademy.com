defmodule Stevia.Farms.InputType do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farm_input_types"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      allow_nil? false
      description "The name of the input type (e.g., seed, fertilizer, pesticide)."
    end

    attribute :unit, :string do
      allow_nil? false
      description "The unit of measurement for the input (e.g., kg, liters)."
    end

    timestamps()
  end

  relationships do
    belongs_to :planting, Stevia.Farms.Planting
  end
end
