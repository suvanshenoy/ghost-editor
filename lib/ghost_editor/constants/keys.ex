defmodule GhostEditor.Constants.Keys do
  import Ratatouille.Constants, only: [key: 1]

  defmacro __using__(_) do
    quote do
      @spacebar key(:space)
      @backspace key(:backspace)
      @backspace2 key(:backspace2)
      @enter key(:enter)

      @ctrl_d key(:ctrl_d)
      @ctrl_w key(:ctrl_w)
      @ctrl_a key(:ctrl_a)
      @ctrl_s key(:ctrl_s)

      @scroll_up @ctrl_w
      @scroll_down @ctrl_s
      @scroll_right @ctrl_d
      @scroll_left @ctrl_a

      @scroll_keys [
        @scroll_up,
        @scroll_down,
        @scroll_right,
        @scroll_left
      ]

      @delete_keys [
        @backspace,
        @backspace2
      ]
    end
  end
end
