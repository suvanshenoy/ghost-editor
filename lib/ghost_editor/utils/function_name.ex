defmodule GhostEditor.Utils.FunctionName do
  defmacro name() do
    {function_name, arity} = __CALLER__.function
    "&#{function_name}/#{arity}"
  end
end
