defmodule GhostEditor.Actions.Resize do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Resize.ResizeEvents
  alias GhostEditor.Model

  def update(model = %Model{}, message) do
    case message do
      {:event, %{key: key}} ->
        case key do
          # @ctrl_r ->
          #   ResizeEvents.event(:resize_mode, %{model: model})

          @arrow_right ->
            ResizeEvents.event(:resize_minus_x, model)

          @arrow_left ->
            ResizeEvents.event(:resize_plus_x, model)

          _ ->
            model
        end

      _ ->
        model
    end
  end
end
