defmodule GhostEditor.Actions.Display do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Display.DisplayEvents

  def init(model) do
    model
  end

  def update(model, message) do
    case message do
      {:event, %{key: key}} ->
        case key do
          @ctrl_m ->
            DisplayEvents.display_menu_event(model)

          @ctrl_d ->
            DisplayEvents.display_screen_event(model)
        end
    end
  end
end
