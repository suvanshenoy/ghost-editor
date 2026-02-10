defmodule GhostEditor.Layout do
  use GhostEditor.Constants.Colors

  alias GhostEditor.UI.FileMenu
  alias GhostEditor.UI.Screen

  def render(model) do
    %{
      displays: displays
    } =
      model

    {_, files} = File.ls()

    case displays do
      # %{menu: %{traverse: %{up: 1}}} ->
      #   Screen.render(
      #     %{
      #       model
      #       | displays: %{screen: %{size: 10}}
      #     },
      #     FileMenu.render(%{
      #       model
      #       | displays: %{menu: %{size: 2, files: files, menu: %{traverse: %{up: 1}}}}
      #     })
      #   )

      # %{menu: %{traverse: %{down: 1}}} ->
      #   Screen.render(
      #     %{
      #       model
      #       | displays: %{screen: %{size: 10}}
      #     },
      #     FileMenu.render(%{
      #       model
      #       | displays: %{menu: %{size: 2, files: files, menu: %{traverse: %{down: 1}}}}
      #     })
      #   )

      _ ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{size: 2, files: files}}
          })
        )
    end
  end
end
