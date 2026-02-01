defmodule GhostEditor.Actions.Typing do
  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    %{text: text} = model

    case message do
      {:event, %{key: key}} when key in @delete_keys ->
        %{model | text: String.slice(text, 0, String.length(text) - 1)}

      {:event, %{key: @enter}} ->
        %{model | text: text <> "\n"}

      {:event, %{key: @spacebar}} ->
        %{model | text: text <> " "}

      {:event, %{ch: ch}} when ch > 0 ->
        %{model | text: text <> <<ch::utf8>>}

      _ ->
        model
    end
  end
end
