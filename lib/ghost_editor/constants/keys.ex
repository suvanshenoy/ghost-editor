defmodule GhostEditor.Constants.Keys do
  import Ratatouille.Constants, only: [key: 1]

  defmacro __using__(_) do
    quote do
      @spacebar key(:space)
      @backspace key(:backspace)
      @backspace2 key(:backspace2)
      @enter key(:enter)

      # @move_up key(?k)
      # @move_down key(?j)
      # @move_left key(?l)
      # @move_right key(?r)

      @delete_keys [
        @backspace,
        @backspace2
      ]
    end
  end
end
