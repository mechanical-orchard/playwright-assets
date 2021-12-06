import * as shell from "shelljs";
shell.cp("-R", "priv/assets", "pkg/");
shell.cp("-R", "priv/extras", "pkg/");
shell.cp("-R", "src/views", "pkg/");
