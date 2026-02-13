defmodule GhostEditor.Actions.Switch.SwitchEvents do
  use GhostEditor.Constants.Keys

  def event(:focus_screen, %{model: model}) do
    %{displays: displays} = model

    %{
      model
      | displays: %{
          screen: %{focus: 1, focussed_file: displays.screen.focussed_file},
          menu: %{traverse: displays.menu.traverse, files: displays.menu.files}
        }
    }
  end

  def event(:focus_menu, %{model: model}) do
    %{displays: displays} = model

    %{
      model
      | displays: %{
          menu: %{
            focus: 1,
            traverse: %{up: displays.menu.traverse.up},
            files: displays.menu.files
          },
          screen: displays.screen
        }
    }
  end
end
