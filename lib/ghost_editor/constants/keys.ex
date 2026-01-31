defmodule GhostEditor.Constants.Keys do
  import Ratatouille.Constants

  defmacro __using__(_) do
    quote do
      @spacebar key(:space)

      @delete_keys [
        key(:backspace),
        key(:backspace2)
      ]
    end
  end
end
