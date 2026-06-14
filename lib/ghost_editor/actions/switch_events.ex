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
      | mode: "switch",
        key: "ctrl_e",
        displays: %{
          screen: %{focus: 1, size: displays.menu.size},
          menu: %{
            focus: 0,
            size: displays.menu.size,
            traverse: %{up: 1}
          }
        }
    }
  end

  def event(:focus_menu, %{model: model}) do
    %{displays: displays} = model

    %{
      model
      | mode: "switch",
        key: "ctrl_w",
        displays: %{
          screen: %{focus: 0, size: displays.menu.size},
          menu: %{
            focus: 1,
            size: displays.menu.size,
            traverse: %{up: 1}
          }
        }
    }
  end
end
