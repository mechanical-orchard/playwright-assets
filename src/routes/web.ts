import * as express from "express";
import * as path from "path"

export const register = (app: express.Application) => {
  // app.use("/assets", express.static("assets"));
  // app.use("/extras", express.static("extras"));
  app.use("/assets", express.static(path.join(__dirname, "../assets")));
  app.use("/extras", express.static(path.join(__dirname, "../extras")));

  app.get("/", (req: any, res) => {
    res.render("index");
  });
};
