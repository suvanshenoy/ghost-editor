defmodule GhostEditor.KeyNotifer do
  # import Ratatouille.Constants, only: [key: 1]

  def init(model) do
    model
  end

  def update(model, message) do
    %{key: key} = model

    case message do
      {:event, %{key: key}} ->
        %{model | key: "#{key}"}

      {:event, %{ch: ch}} ->
        %{model | key: "#{ch}"}

      _ ->
        %{model | key: key}
    end
  end
end
