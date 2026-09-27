defmodule GhostEditor.Actions.Display.DisplayEvents do
  alias GhostEditor.Model

  @spec event(:display_screen | :display_menu, %{model: any()}) :: %{
          displays: %{screen: %{show: 0 | 1}, menu: %{show: 0 | 1}}
        }

  def event(:display_screen, model = %Model{}) do
    %{model | mode: "display", key: "ctrl_d", displays: %{screen: %{show: 1}, menu: %{show: 0}}}
  end

  def event(:display_menu, model = %Model{}) do
    %{model | mode: "display", key: "ctrl_m", displays: %{screen: %{show: 0}, menu: %{show: 1}}}
  end
end
