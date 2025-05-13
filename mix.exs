defmodule Boilerex.MixProject do
  use Mix.Project

  def project do
    [
      app: :boilerex,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Boilerex.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:exsync, "~> 0.4"},
      {:temple, "~> 0.11.0"},
      {:tailwind, "~> 0.3", only: :dev}
    ]
  end
end
