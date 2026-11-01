defmodule GhostEditor.Model do
  @type t() :: %__MODULE__{
          focus: :screen | :menu,
          textarea: reference() | nil
        }

  defstruct focus: :screen,
            textarea: nil
end
