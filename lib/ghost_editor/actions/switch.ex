defmodule GhostEditor.Actions.Switch do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Switch.SwitchEvents
  alias GhostEditor.Model

  @spec update(
          any(),
          {:event,
           %{
             key:
               Ratatouille.Constants.key(:ctrl_w)
               | Ratatouille.Constants.key(:ctrl_e)
           }}
        ) :: %{
          displays: %{
            screen: %{focus: 0 | 1},
            menu: %{
              focus: 0 | 1,
              traverse: %{up: number()},
              files: [String.t()],
              focussed_file: String.t()
            }
          }
        }

  def update(model = %Model{}, message) do
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
