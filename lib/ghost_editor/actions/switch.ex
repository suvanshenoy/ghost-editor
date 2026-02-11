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
            SwitchEvents.event(:focus_menu, model)

          @ctrl_e ->
            SwitchEvents.event(:focus_screen, model)

          _ ->
            model
        end

      _ ->
        model
    end
  end
end
