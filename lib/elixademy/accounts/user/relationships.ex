defmodule Elixademy.Accounts.User.Relationships do
  use Spark.Dsl.Fragment, of: Ash.Resource

  relationships do
    belongs_to :team, Elixademy.Accounts.Team do
      description "Current team object"
      source_attribute :current_team
      destination_attribute :domain
    end

    many_to_many :teams, Elixademy.Accounts.Team do
      through Elixademy.Accounts.UserTeam
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :team_id
    end

    many_to_many :groups, Elixademy.Accounts.Group do
      through Elixademy.Accounts.UserGroup
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :group_id
    end

    has_many :impersonations, Elixademy.Accounts.UserImpersonation do
      destination_attribute :impersonated_user_id
      description "Active impersonation for this user"
    end
  end
end
