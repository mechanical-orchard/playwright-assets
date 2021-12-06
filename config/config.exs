import Config

{port, _} = Integer.parse(System.get_env("PLAYWRIGHT_ASSETS_PORT", "4002"))

config :playwright_assets,
  port: port
