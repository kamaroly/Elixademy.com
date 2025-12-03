defmodule Elixademy.Accounts do
  use Ash.Domain,
    otp_app: :Elixademy

  resources do
    resource Elixademy.Accounts.Token
    resource Elixademy.Accounts.User
    resource Elixademy.Accounts.Team
    resource Elixademy.Accounts.UserTeam

    resource Elixademy.Accounts.Group
    resource Elixademy.Accounts.UserGroup
    resource Elixademy.Accounts.GroupPermission

    resource Elixademy.Accounts.UserImpersonation
  end
end
