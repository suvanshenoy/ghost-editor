defmodule GhostEditor.Constants.Keys do
  import Ratatouille.Constants, only: [key: 1]

  defmacro __using__(_) do
    quote do
      @spacebar key(:space)
      @backspace key(:backspace)
      @backspace2 key(:backspace2)
      @enter key(:enter)
      @escape key(:esc)

      @ctrl_d key(:ctrl_d)
      @ctrl_s key(:ctrl_s)
      @ctrl_m key(:ctrl_m)
      @ctrl_k key(:ctrl_k)

      @scroll_up ?w
      @scroll_down ?s
      @scroll_right ?d
      @scroll_left ?a

      @move_up ?k
      @move_down ?j
      @move_right ?h
      @move_left ?l

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

      @motion_keys [
        @move_up,
        @move_down,
        @move_right,
        @move_left
      ]
    end
  end
end
