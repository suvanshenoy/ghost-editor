defmodule GhostEditor.Actions.Traverse.MenuTraverseEvents do
  @spec event(:traverse_down | :traverse_up, %{model: any()}) :: %{
          displays: %{
            menu: %{
              focus: 1,
              traverse: %{up: number()},
              files: [String.t()],
              focussed_file: String.t()
            }
          }
        }

  def event(:traverse_down, %{model: model}) do
    %{displays: displays} = model

    up = displays.menu.traverse.up + 1

    %{
      model
      | displays: %{
          menu: %{
            focus: 1,
            traverse: %{up: up},
            files: displays.menu.files
          }
        }
    }
  end

  def event(:traverse_up, %{model: model}) do
    %{displays: displays} = model

    up = displays.menu.traverse.up - 1

    %{
      model
      | displays: %{
          menu: %{
            focus: 1,
            traverse: %{up: up},
            files: displays.menu.files
          }
        }
    }
  end
end
