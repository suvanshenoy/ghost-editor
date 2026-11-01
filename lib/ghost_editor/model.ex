defmodule GhostEditor.Model do
  @type t() :: %__MODULE__{
          displays: %{screen: nil},
          textarea: reference()
        }

  defstruct displays: %{
              screen: nil
            },
            textarea: nil
end
