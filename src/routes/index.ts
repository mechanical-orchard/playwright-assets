import * as express from "express";
import * as web from "./web"

export const register = (app : express.Application) => {
  web.register(app);
};
