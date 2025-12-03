defmodule Elixademy.Accounts.Fragments.Multitenancies do
  use Spark.Dsl.Fragment, of: Ash.Resource

  preparations do
    prepare Elixademy.Preparations.SetTenant
  end

  changes do
    change Elixademy.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end
end
