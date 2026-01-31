defmodule GhostEditor.UI.Screen do
  @behaviour Ratatouille.App

  import Ratatouille.View

  use GhostEditor.Constants.Keys

  @impl true
  def update(model, mesg) do
    %{window: %{height: _, width: _}, text: txt} = model

    case mesg do
      {:event, %{key: key}} when key in @delete_keys ->
        String.slice(txt, 0..-2)

      {:event, %{key: @spacebar}} ->
        txt <> " "

      {:event, %{ch: ch}} when ch > 0 ->
        txt <> <<ch::utf8>>

      _ ->
        txt
    end
  end

  @impl true
  def render(model) do
    %{window: %{height: height, width: _}, text: txt} = model

    view do
      panel(height: height) do
        render_tilde()
        label(content: txt <> "| ")
      end
    end
  end

  def render_tilde do
    canvas_cell = canvas_cell(x: 0, y: 0, char: "~")

    for _ <- 1..20 do
      canvas(height: 1, width: 1) do
        [canvas_cell]
      end
    end
  end
end
