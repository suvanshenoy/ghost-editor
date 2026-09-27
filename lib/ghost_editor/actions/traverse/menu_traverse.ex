defmodule GhostEditor.Actions.Traverse.MenuTraverse do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Traverse.MenuTraverseEvents
  alias GhostEditor.Model

  def init(model) do
    model
  end

  @spec update(any(), {
          :event,
          %{ch: ?j | ?k, key: Ratatouille.Constants.key(:ctrl_e)}
        }) :: %{
          displays: %{
            menu: %{
              focus: 1,
              traverse: %{up: number()},
              files: [String.t()]
            }
          }
        }

  def update(model = %Model{}, message) do
    case message do
      {:event, %{ch: @move_down}} ->
        MenuTraverseEvents.event(:traverse_down, model)

      {:event, %{ch: @move_up}} ->
        MenuTraverseEvents.event(:traverse_up, model)

      _ ->
        model
    end
  end
end
