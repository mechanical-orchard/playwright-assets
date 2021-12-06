import dotenv from "dotenv";
import express from "express";
import path from "path";

import * as routes from "./routes";

dotenv.config({ path: ".local/envrc" });

const port = process.env.WEBSERVER_PORT || '4002';
const app = express();

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

routes.register(app);

// ---

import * as http from "http";

const server = http.createServer(app);

server.listen(port, () => {
  console.log(`"Starting Playwright Assets server at http://localhost:${port}"`);
});
