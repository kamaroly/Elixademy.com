defmodule Stevia.Farms.Employee do
  use Ash.Resource,
    domain: Stevia.Farms,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Stevia.Accounts.Fragments.GlobalPolicies,
      Stevia.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "farm_employees"
    repo Stevia.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      allow_nil? false
      description "The name of the employee."
    end

    attribute :role, :atom do
      allow_nil? false
      constraints one_of: [:farmhand, :manager]
      description "The role of the employee (e.g., farmhand, manager)."
    end

    attribute :hire_date, :date do
      allow_nil? false
      description "The date when the employee was hired."
    end

    attribute :hourly_rate, :decimal do
      allow_nil? false
      description "The hourly wage rate of the employee."
    end

    timestamps()
  end

  relationships do
    has_many :labor_assignments, Stevia.Farms.LaborAssignment
  end
end
