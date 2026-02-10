defmodule GhostEditor.Actions.Traverse.MenuTraverse do
  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    case message do
      {:event, %{ch: ?1}} ->
        %{model | displays: %{menu: %{traverse: %{up: 1}}}}

      {:event, %{ch: ?2}} ->
        %{model | displays: %{menu: %{traverse: %{down: 1}}}}
    end
  end
end
