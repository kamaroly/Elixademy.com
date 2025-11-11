defmodule Stevia.Farms.Harvest do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farm_planting_harvest"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :harvest_date, :date do
      allow_nil? false
      description "The date when the harvest occurred."
    end

    attribute :quantity_harvested, :float do
      allow_nil? false
      description "The quantity of crop harvested (e.g., in kg)."
    end

    attribute :quality_grade, :string do
      allow_nil? true
      description "The quality grade of the harvested crop (e.g., A, B)."
    end

    attribute :notes, :string do
      allow_nil? true
      description "Additional notes about the harvest."
    end

    timestamps()
  end

  relationships do
    belongs_to :planting, Stevia.Farms.Planting
  end
end
