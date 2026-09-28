local osc52 = require("vim.ui.clipboard.osc52")

local function paste()
  return {
    vim.fn.getreg("", 1, true),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52 (Copy Only)",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

vim.opt.clipboard = "unnamedplus"
