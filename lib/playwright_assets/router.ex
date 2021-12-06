defmodule PlaywrightAssets.Router do
  use Plug.Router
  require Plug.Builder

  plug(Plug.Static, at: "/assets", from: "#{__DIR__}/../../priv/assets")
  plug(Plug.Static, at: "/extras", from: "#{__DIR__}/../../priv/extras")

  plug(:match)
  plug(:dispatch)

  get("/") do
    send_resp(conn, 200, "Serving Playwright assets")
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
