defmodule Stevia.Accounts.Fragments.Multitenancies do
  use Spark.Dsl.Fragment, of: Ash.Resource

  preparations do
    prepare Stevia.Preparations.SetTenant
  end

  changes do
    change Stevia.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end
end
