defmodule SteviaWeb.CoreComponents.AshFormTest do
  use SteviaWeb.ConnCase

  describe "Ash Form" do
    test "Form can be rendered" do
      _assigns = %{
        id: Ash.UUIDv7.generate(),
        resource: Stevia.Members.Member,
        actor: %{},
        tenant: "test",
        authorize?: false
      }
    end
  end
end
