defmodule GhostEditor.Model do
  @type t() :: %__MODULE__{
          window: any(),
          text: String.t(),
          text_cursor: %{text_cursor_x: integer(), text_cursor_y: integer()},
          cursor_position: %{cursor_position_x: integer(), cursor_position_y: integer()},
          displays: %{
            screen: %{size: integer(), show: integer(), focus: integer()},
            menu: %{
              size: integer(),
              show: integer(),
              traverse: %{up: integer()},
              files: list(),
              focus: integer()
            },
            cursor_bar: %{size: integer()}
          },
          mode: String.t(),
          key: String.t()
        }

  defstruct window: nil,
            text: "",
            text_cursor: %{text_cursor_x: 0, text_cursor_y: 0},
            cursor_position: %{cursor_position_x: 0, cursor_position_y: 0},
            displays: %{
              screen: %{size: 0, show: 0, focus: 0},
              menu: %{size: 0, show: 0, traverse: %{up: 0}, files: [], focus: 0},
              cursor_bar: %{size: 0}
            },
            mode: "",
            key: ""
end
