defmodule TreeMagic.MixProject do
  use Mix.Project

  def project do
    [
      app: :tree_magic,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      deps: deps(),
      package: package(),
      rustler_crates: rustler_crates()
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
      {:rustler, "0.21.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp rustler_crates do
    [
      tree_magic_nif: [
        mode: (if Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end

  defp package do
    [
      name: "tree_magic",
      description: "Binding to tree_magic, providing MIME information for files.",
      licenses: ["LGPL-3.0-only"],
      homepage_url: "https://github.com/commonspub/twinkle_star",
      links: %{
        "GitHub" => "https://github.com/commonspub/twinkle_star",
        "CommonsPub" => "https://github.com/commonspub",
      }
    ]
  end
end
