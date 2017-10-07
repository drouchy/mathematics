defmodule Mathematics.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mathematics,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp elixirc_paths(:travis), do: elixirc_paths(:test)
  defp elixirc_paths(:test),   do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),       do: ["lib", "web"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:mix_test_watch, "~> 0.5.0"},
      {:eqc_ex, "~> 1.4", only: [:dev, :travis, :test]},
      {:excoveralls, "~> 0.7.4", only: [:test, :travis]},
      {:dialyxir, "~> 0.5", only: [:dev, :travis], runtime: false}
    ]
  end
end
