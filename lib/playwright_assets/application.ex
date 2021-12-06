defmodule PlaywrightAssets.Application do
  @moduledoc false
  use Application
  require Logger

  @impl Application
  def start(_, _) do
    port = Application.get_env(:playwright_assets, :port)
    Logger.info("Starting Playwright Assets server at http://localhost:#{port}")

    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: PlaywrightAssets.Router,
        options: [
          ip: {0, 0, 0, 0},
          port: port,
          protocol_options: [
            idel_timeout: 1000,
            request_timeout: 1000
          ]
        ]
      )
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__)
  end
end
