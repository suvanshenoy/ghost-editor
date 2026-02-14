defmodule GhostEditor.Actions.Display.DisplayEvents do
  @spec event(:display_screen | :display_menu, %{model: any()}) :: %{
          displays: %{screen: %{show: 0 | 1}, menu: %{show: 0 | 1}}
        }

  def event(:display_screen, %{model: model}) do
    %{model | displays: %{screen: %{show: 1}, menu: %{show: 0}}}
  end

  def event(:display_menu, %{model: model}) do
    %{model | displays: %{screen: %{show: 0}, menu: %{show: 1}}}
  end
end
