local util = require("conform.util")

---@type conform.FileFormatterConfig
return {
  meta = {
    url = "https://github.com/oxc-project/oxc",
    description = [[Oxfmt is a Prettier-compatible code formatter written in Rust. It enforces a consistent style by parsing your code and re-printing it with its own rules.]],
  },
  command = "oxlint",
  args = { "format", "$FILENAME" },
  stdin = false, -- oxfmt modifies files in-place, doesn't support stdin/stdout
  cwd = util.root_file({
    ".oxfmtrc.json",
    ".oxfmtrc.jsonc",
    "package.json",
  }),
}
