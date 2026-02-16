defmodule GhostEditor.AdjustSize do
  @spec adjust(:menu | :screen | :cursor_bar, %{model: any()}) :: number()

  def adjust(:menu, %{model: model}) do
    %{window: window, displays: displays} = model

    size =
      cond do
        window.width < 192 -> displays.menu.size + 1
        true -> displays.menu.size
      end

    size
  end

  def adjust(:screen, %{model: model}) do
    %{window: window, displays: displays} = model

    size =
      cond do
        window.width < 192 -> displays.screen.size - 0.8
        true -> displays.screen.size
      end

    size
  end

  def adjust(:cursor_bar, %{model: model}) do
    %{window: window, displays: displays} = model

    size =
      cond do
        window.width < 192 -> displays.cursor_bar.size + 2
        true -> displays.cursor_bar.size
      end

    size
  end
end
