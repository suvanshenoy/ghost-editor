defmodule GhostEditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :ghosteditor,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ratatouille, git: "https://github.com/ndreynolds/ratatouille.git"}
    ]
  end
end
