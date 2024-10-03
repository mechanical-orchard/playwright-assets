defmodule PlaywrightAssets.Router do
  use Plug.Router
  require Plug.Builder

  plug(:match)
  plug(:dispatch)

  get("/") do
    send_resp(conn, 200, "Serving Playwright assets!!!")
  end

  match("/:root/:file") do
    respond_with(conn, "#{root}/#{file}")
  end

  match("/:root/:path/:file") do
    respond_with(conn, "#{root}/#{path}/#{file}")
  end

  match _ do
    send_resp(conn, 404, "404")
  end

  # private
  # ----------------------------------------------------------------------------

  defp respond_with(conn, path) do
    case File.read("#{__DIR__}/../../priv/#{path}") do
      {:error, :enoent} ->
        send_resp(conn, 404, "404")

      {:ok, body} ->
        conn = put_resp_header(conn, "x-playwright-request-method", conn.method)

        conn =
          (String.ends_with?(path, ".json") &&
             put_resp_header(conn, "content-type", "application/json")) || conn

        send_resp(conn, 200, body)
    end
  end
end
