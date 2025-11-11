defmodule Stevia.Accounts.GroupPermission do
  use Ash.Resource,
    domain: Stevia.Accounts,
    data_layer: AshPostgres.DataLayer,
    notifiers: Ash.Notifier.PubSub

  postgres do
    table "group_permissions"
    repo Stevia.Repo
  end

  actions do
    default_accept [:resource, :action, :group_id]
    defaults [:create, :read, :update, :destroy]

    create :sync do
      accept []
      description "Sync permissions"
      argument :permissions, {:array, :map}, allow_nil?: false
      manual Stevia.Accounts.GroupPermission.Changes.SyncPermissions
    end
  end

  preparations do
    prepare Stevia.Preparations.SetTenant
  end

  changes do
    change Stevia.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end

  attributes do
    uuid_v7_primary_key :id
    attribute :action, :string, allow_nil?: false
    attribute :resource, :string, allow_nil?: false
    timestamps()
  end

  relationships do
    belongs_to :group, Stevia.Accounts.Group do
      description "Relationshp with a group inside a tenant"
      source_attribute :group_id
      allow_nil? false
    end
  end

  identities do
    identity :unique_group_permission, [:group_id, :resource, :action]
  end
end
