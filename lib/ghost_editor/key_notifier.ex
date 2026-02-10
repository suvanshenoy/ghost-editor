defmodule GhostEditor.KeyNotifer do
  def init(model) do
    model
  end

  def update(model, message) do
    # %{key: key} = model

    case message do
      {:event, %{key: key}} ->
        %{model | key: "#{key}"}

        # {:event, %{ch: ch}} when ch > 0 ->
        #   %{model | key: "" <> <<ch::utf8>>}
    end
  end
end
