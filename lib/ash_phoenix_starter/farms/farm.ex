defmodule Stevia.Farms.Farm do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farms"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      allow_nil? false
      description "The name of the farm."
    end

    attribute :location, :string do
      allow_nil? false
      description "The geographical location of the farm."
    end

    attribute :total_area, :float do
      allow_nil? false
      description "The total area of the farm in acres or hectares."
    end

    timestamps()
  end

  relationships do
    has_many :fields, Stevia.Farms.Field
  end
end
