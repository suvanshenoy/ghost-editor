defmodule GhostEditor.Actions.Switch.SwitchEvents do
  use GhostEditor.Constants.Keys

  @spec event(:focus_screen | :focus_menu, %{model: any()}) :: %{
          displays: %{
            screen: %{focus: 0 | 1},
            menu: %{
              focus: 0 | 1,
              traverse: %{up: number()},
              files: [String.t()]
            }
          }
        }

  def event(:focus_screen, %{model: model}) do
    %{displays: displays} = model

    %{
      model
      | displays: %{
          screen: %{focus: 1},
          menu: %{
            traverse: %{up: displays.menu.traverse.up},
            files: displays.menu.files
          }
        }
    }
  end

  def event(:focus_menu, %{model: model}) do
    %{displays: displays} = model

    %{
      model
      | displays: %{
          screen: %{focus: 0},
          menu: %{
            focus: 1,
            traverse: %{up: displays.menu.traverse.up},
            files: displays.menu.files
          }
        }
    }
  end
end
