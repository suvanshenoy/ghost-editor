defmodule GhostEditor.Actions.Traverse.MenuTraverse do
  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    %{displays: %{menu: %{id: id}}} = model

    case message do
      {:event, %{key: @ctrl_m}} ->
        %{model | displays: %{menu: %{id: id, traverse: %{up: 1}}}}
    end
  end
end
