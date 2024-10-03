defmodule PlaywrightAssets.MixProject do
  use Mix.Project
  @source_url "https://github.com/geometerio/playwright-assets"

  def project do
    [
      app: :playwright_assets,
      deps: deps(),
      description:
        "Playwright Assets is a package for installing and running test assets in Playwright Node.js and Elixir implementations.",
      dialyzer: dialyzer(),
      docs: docs(),
      version: "1.44.2",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: @source_url,
      package: package(),
      preferred_cli_env: [credo: :test, dialyzer: :test, docs: :docs],
      source_url: @source_url,
      start_permanent: true
    ]
  end

  def application do
    [
      mod: {PlaywrightAssets.Application, []},
      extra_applications: [:logger]
    ]
  end

  # ---

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp deps do
    [
      {:cowlib, "~> 2.7.3"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.25", only: :dev, runtime: false},
      {:mix_audit, "~> 1.0", only: [:dev, :test], runtime: false},
      {:plug_cowboy, "~> 2.1.3"},
      {:plug, "~> 1.12"}
    ]
  end

  defp docs do
    [
      name: "Playwright Assets",
      source_url: @source_url,
      homepage_url: @source_url,
      main: "README",
      extras: [
        "README.md": [filename: "README"]
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["ISC"],
      links: %{
        homepage: @source_url,
        source: @source_url
      },
      files: ~w(lib priv LICENSE LICENSE_APACHE mix.exs package.json README.md)
    ]
  end
end
