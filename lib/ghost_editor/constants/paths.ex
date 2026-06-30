defmodule GhostEditor.Constants.Paths do
  defmacro __using__(_) do
    quote do
      @cache_dir Path.expand("~/.ghost_editor")
      @current_file_path Path.expand(Path.join("~/.ghost_editor", "current_file"))
      @focussed_file_path Path.expand(Path.join(@cache_dir, "focussed_file"))
    end
  end
end
