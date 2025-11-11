defmodule Stevia.Accounts.Fragments.GlobalPolicies do
  use Spark.Dsl.Fragment,
    of: Ash.Resource,
    authorizers: [Ash.Policy.Authorizer]

  policies do
    policy always() do
      access_type :strict
      authorize_if Stevia.Accounts.Checks.Authorize
    end
  end
end
