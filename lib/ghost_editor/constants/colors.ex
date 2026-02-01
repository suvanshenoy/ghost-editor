defmodule GhostEditor.Constants.Colors do
  defmacro __using__(_) do
    quote do
      @default_text_color :magenta
      @default_border_color :magenta
      @default_background_color :magenta
    end
  end
end
