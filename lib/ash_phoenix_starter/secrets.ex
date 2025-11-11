defmodule Stevia.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Stevia.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:AshPhoenixStarter, :token_signing_secret)
  end
end
