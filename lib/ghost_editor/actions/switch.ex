defmodule GhostEditor.Actions.Switch do
  alias GhostEditor.Actions.Switch.SwitchEvents

  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    case message do
      {:event, %{key: key}} ->
        case key do
          @ctrl_w ->
            SwitchEvents.switch_to_menu_event(model)

          @ctrl_e ->
            SwitchEvents.switch_to_screen_event(model)

          _ ->
            model
        end

      _ ->
        model
    end
  end
end
