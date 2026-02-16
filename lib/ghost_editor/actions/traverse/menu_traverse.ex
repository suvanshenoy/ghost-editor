defmodule GhostEditor.Actions.Traverse.MenuTraverse do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Traverse.MenuTraverseEvents
  alias GhostEditor.Actions.Switch.SwitchEvents

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
              files: [String.t()],
              focussed_file: String.t()
            }
          }
        }

  def update(model, message) do
    case message do
      {:event, %{ch: @move_down}} ->
        MenuTraverseEvents.event(:traverse_down, %{model: model})

      {:event, %{key: @ctrl_e}} ->
        SwitchEvents.event(:focus_screen, %{model: model})

      {:event, %{ch: @move_up}} ->
        MenuTraverseEvents.event(:traverse_up, %{model: model})

      _ ->
        model
    end
  end
end
