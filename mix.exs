defmodule Discovery.Mixfile do
  use Mix.Project

  def project do
    [
      app: :discovery,
      version: "0.0.1",
      elixir: "~> 0.14.0",
      deps: deps,
      package: package,
      description: description
    ]
  end

  def application do
    [
      mod: {Discovery, []},
      applications: [
        :consul,
        :hash_ring_ex,
      ],
      registered: [
        Discovery.Directory,
        Discovery.NodeConnector,
      ],
      env: [
        retry_connect_ms: 5000,
        replica_count: 128,
      ]
    ]
  end

  defp deps do
    [
      {:consul, git: "git@github.com:undeadlabs/consul-ex.git"},
      {:hash_ring_ex, "~> 1.1"},
    ]
  end

  defp description do
    """
    An OTP application for auto-discovering services with Consul
    """
  end

  defp package do
    %{licenses: ["MIT"],
      links: %{"Github" => "https://github.com/undeadlabs/discovery"}}
  end
end
