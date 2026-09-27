defmodule GhostEditor.AdjustSize do
  alias GhostEditor.Model

  @spec adjust(:menu | :screen | :cursor_bar, %{model: any()}) :: number()

  def adjust(:menu, model = %Model{}) do
    %{window: window, displays: displays} = model

    cond do
      window.width < 192 ->
        displays.menu.size + 0.89

      window.width == 166 || window.width == 179 || window.width == 188 ->
        2.83

      true ->
        displays.menu.size
    end
  end

  def adjust(:screen, model = %Model{}) do
    %{window: window, displays: displays} = model

    cond do
      window.width < 192 -> displays.screen.size - 0.8
      window.width == 95 -> 12.9
      true -> displays.screen.size
    end
  end

  def adjust(:cursor_bar, model = %Model{}) do
    %{window: window, displays: displays} = model

    cond do
      window.width < 192 ->
        displays.cursor_bar.size + 3

      true ->
        displays.cursor_bar.size + 1
    end
  end
end
