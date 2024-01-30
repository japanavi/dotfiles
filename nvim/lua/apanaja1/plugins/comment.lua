return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")
    -- enable comment
    comment.setup({})
  end,
}
