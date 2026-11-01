defmodule GhostEditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :ghost_editor,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      test_paths: ["."],
      test_pattern: "*_test.exs",
      deps: deps(),
      releases: releases()
    ]
  end

  def releases do
    [
      ghost_editor: [
        steps: [:assemble, &ExRatatui.Burrito.verify_linux_nif/1, &Burrito.wrap/1],
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

  def application do
    [
      mod: {GhostEditor.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:mix_test_interactive, "~> 5.1", only: :dev, runtime: false},
      {:ex_ratatui, git: "https://github.com/mcass19/ex_ratatui.git"},
      {:burrito, git: "https://github.com/burrito-elixir/burrito.git"}
    ]
  end
end
