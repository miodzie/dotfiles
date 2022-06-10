local M = {}

function M.nav_test_toggle()
  local b = vim.fn.expand("%")
  local type = vim.bo.filetype
  if type == "go" then
    if string.find(b, "_test.go") then 
      filename = string.gsub(b, "(.)%_test.go", "%1.go")
    else 
      filename = string.gsub(b, "(.)%.go", "%1_test.go")
    end
  end

  if type == "php" then
    if string.find(b, "Test%.php") then
      local class = vim.fn.expand("%:t")
      class = string.gsub(class, "(%w+)Test", "%1")
      local result = vim.fn.systemlist('fd ' .. class)
      for k,v in pairs(result) do
        filename = v
        break
      end
    else 
      local class = vim.fn.expand("%:t:r")
      local result = vim.fn.systemlist('fd "' .. class .. 'Test\\.php"')
      for k,v in pairs(result) do
        filename = v
        break
      end
    end
  end

  if filename ~= nil then
    local buf_id = vim.fn.bufnr(filename, true)
    vim.api.nvim_set_current_buf(buf_id)
  else
    -- print("Unknown test file")
  end
end


function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- M.navtest()

-- TODO: get filename from treesitter api
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

-- to execute the function
-- colors()
-- local b = require('telescope.builtin')
-- b.fd()
-- vim.cmd(':normal i LICENSE')
return M
