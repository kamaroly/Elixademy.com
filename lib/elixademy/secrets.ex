defmodule Elixademy.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Elixademy.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:Elixademy, :token_signing_secret)
  end
end
