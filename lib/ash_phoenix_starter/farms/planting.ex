defmodule Stevia.Farms.Planting do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farm_plantings"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :planting_date, :date do
      allow_nil? false
      description "The date when the crop was planted."
    end

    attribute :expected_harvest_date, :date do
      allow_nil? false
      description "The expected date for harvesting the crop."
    end

    attribute :quantity_planted, :float do
      allow_nil? false
      description "The quantity of crop planted (e.g., in kg or number of plants)."
    end

    timestamps()
  end

  relationships do
    belongs_to :field, Stevia.Farms.Field
    belongs_to :crop, Stevia.Farms.Crop
    has_one :harvest, Stevia.Farms.Harvest
    # Assuming one-to-one for simplicity; can be has_many if partial harvests
    has_many :input_applications, Stevia.Farms.InputApplication
    has_many :labor_assignments, Stevia.Farms.LaborAssignment
  end
end
