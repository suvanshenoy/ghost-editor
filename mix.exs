defmodule GhostEditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :ghosteditor,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def releases do
    [
      ghosteditor: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            # macos: [os: :darwin, cpu: :x86_64],
            # macos_silicon: [os: :darwin, cpu: :aarch64],
            linux: [os: :linux, cpu: :x86_64]
            # windows: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {GhostEditor.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ratatouille, git: "https://github.com/ndreynolds/ratatouille.git"},
      {:burrito, git: "https://github.com/burrito-elixir/burrito.git"}
    ]
  end
end
