defmodule GhostEditor.Actions.Display do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Display.DisplayEvents
  alias GhostEditor.Model

  def update(model = %Model{}, message) do
    case message do
      {:event, %{key: key}} ->
        case key do
          @ctrl_m ->
            DisplayEvents.event(:display_menu, model)

          @ctrl_d ->
            DisplayEvents.event(:display_screen, model)

          _ ->
            model
        end

      _ ->
        model
    end
  end
end
