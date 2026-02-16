defmodule GhostEditor.Actions.Display do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Display.DisplayEvents

  @spec update(
          any(),
          {:event,
           %{
             key:
               Ratatouille.Constants.key(:ctrl_m)
               | Ratatouille.Constants.key(:ctrl_d)
           }}
        ) :: %{
          displays: %{screen: %{show: 0 | 1}, menu: %{show: 0 | 1}}
        }

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
