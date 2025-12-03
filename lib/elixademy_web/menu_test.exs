defmodule ElixademyWeb.MenuTest do
  use ElixademyWeb.ConnCase

  describe "Menu module" do
    test "left_menu/0 module returns an array" do
      user = create_user()
      assert is_list(ElixademyWeb.Menu.left_menu(user))
    end
  end
end
