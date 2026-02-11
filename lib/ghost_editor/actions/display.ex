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
            DisplayEvents.event(:display_menu, %{model: model})

          @ctrl_d ->
            DisplayEvents.event(:display_screen, %{model: model})

          _ ->
            model
        end

      _ ->
        model
    end
  end
end
