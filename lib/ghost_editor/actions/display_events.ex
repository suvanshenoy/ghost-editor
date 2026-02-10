defmodule GhostEditor.Actions.Display.DisplayEvents do
  def display_screen_event(model) do
    %{model | displays: %{screen: %{show: 1}, menu: %{show: 0}}}
  end

  def display_menu_event(model) do
    %{model | displays: %{screen: %{show: 0}, menu: %{show: 1}}}
  end
end
