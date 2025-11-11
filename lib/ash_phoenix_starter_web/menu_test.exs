defmodule SteviaWeb.MenuTest do
  use SteviaWeb.ConnCase

  describe "Menu module" do
    test "left_menu/0 module returns an array" do
      assert is_list(SteviaWeb.Menu.left_menu())
    end
  end
end
