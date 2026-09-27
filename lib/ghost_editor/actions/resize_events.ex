defmodule GhostEditor.Actions.Resize.ResizeEvents do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Model

  # def event(:resize_mode, %{model: model}) do
  #   %{
  #     model
  #     | mode: "resize"
  #   }
  # end

  def event(:resize_plus_x, model = %Model{}) do
    %{displays: displays} = model

    %{
      model
      | mode: "resize",
        key: "arrow_right",
        displays: %{
          screen: %{size: displays.screen.size + 1},
          menu: %{size: displays.screen.size + 1}
        }
    }
  end

  def event(:resize_minus_x, model = %Model{}) do
    %{displays: displays} = model

    %{
      model
      | mode: "resize",
        key: "arrow_left",
        displays: %{
          screen: %{size: displays.screen.size - 1},
          menu: %{size: displays.screen.size - 1}
        }
    }
  end
end
