vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*"},
  callback = function(args)
    local info = {
      buf = vim.fn.expand("<abuf>"),
      file = vim.fn.expand("<afile>"),
      match = vim.fn.expand("<amatch>"),
      file_type = vim.bo.filetype,
      file_extension = vim.fn.expand("%:e"),
      file_name = vim.fn.expand("%:t:r"),
    }

    
    if info["file_type"] == "javascript" then
      vim.fn.jobstart({"standard", "--fix"})
    end

    if info["file_type"] == "go" then
      vim.fn.jobstart(
        {"golangci-lint", "run", "--fix"},
        {
          stdout_buffered = true,
          on_stdout = function (_, data)
            print("out:", vim.inspect(data))
          end,
          on_stderr = function (_, _)
            print "Check golangci-lint"
          end
        }
      )
    end

    -- vim.schedule(function ()
      -- print("extension", info["file_name"])
    -- end)
  end,
})
