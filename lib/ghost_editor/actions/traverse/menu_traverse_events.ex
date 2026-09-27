defmodule GhostEditor.Actions.Traverse.MenuTraverseEvents do
  alias GhostEditor.Model

  @spec event(:traverse_down | :traverse_up, %{model: any()}) :: %{
          displays: %{
            menu: %{
              focus: 1,
              traverse: %{up: number()},
              files: [String.t()]
            }
          }
        }

  def event(:traverse_down, model = %Model{}) do
    %{displays: displays} = model

    up = displays.menu.traverse.up + 1

    %{
      model
      | mode: "traverse",
        key: "j",
        displays: %{
          menu: %{
            focus: 1,
            size: displays.menu.size,
            traverse: %{up: up}
          }
        }
    }
  end

  def event(:traverse_up, model = %Model{}) do
    %{displays: displays} = model

    up = displays.menu.traverse.up - 1

    %{
      model
      | mode: "traverse",
        key: "k",
        displays: %{
          menu: %{
            focus: 1,
            size: displays.menu.size,
            traverse: %{up: up}
          }
        }
    }
  end
end
