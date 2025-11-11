defmodule Stevia.Accounts do
  use Ash.Domain,
    otp_app: :AshPhoenixStarter

  resources do
    resource Stevia.Accounts.Token
    resource Stevia.Accounts.User
    resource Stevia.Accounts.Team
    resource Stevia.Accounts.UserTeam

    resource Stevia.Accounts.Group
    resource Stevia.Accounts.UserGroup
    resource Stevia.Accounts.GroupPermission
  end
end
