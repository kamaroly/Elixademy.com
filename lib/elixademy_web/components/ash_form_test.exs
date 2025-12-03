defmodule ElixademyWeb.CoreComponents.AshFormTest do
  use ElixademyWeb.ConnCase

  describe "Ash Form" do
    test "Form can be rendered" do
      _assigns = %{
        id: Ash.UUIDv7.generate(),
        resource: Elixademy.Members.Member,
        actor: %{},
        tenant: "test",
        authorize?: false
      }
    end
  end
end
