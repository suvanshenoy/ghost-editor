defmodule GhostEditor.Model do
  @type t() :: %__MODULE__{
          displays: %{screen: nil}
        }

  defstruct displays: %{
              screen: nil
            }
end
