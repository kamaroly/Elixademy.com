defmodule Stevia.Farms do
  use Ash.Domain

  resources do
    resource Stevia.Farms.Farm
    resource Stevia.Farms.Field
    resource Stevia.Farms.Crop
    resource Stevia.Farms.Employee
    resource Stevia.Farms.Harvest
    resource Stevia.Farms.Planting
    resource Stevia.Farms.InputType
    resource Stevia.Farms.LaborAssignment
    resource Stevia.Farms.InputApplication
  end
end
