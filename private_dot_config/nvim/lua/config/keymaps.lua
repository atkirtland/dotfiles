-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    --
    --tabs
    --
    t = {
      name = "tabs",
      o = { "<cmd>tabnew<cr>", "New Tab" },
      c = { "<cmd>tabclose<cr>", "Close Tab" },
      O = { "<cmd>tabonly<cr>", "Close Other Tabs" },
      p = { "<cmd>tabprevious<cr>", "Previous Tab" },
      n = { "<cmd>tabNext<cr>", "Next Tab" }, -- Capital N since 'n' is already used for 'New Tab'
      e = { "<cmd>tabedit ", "Edit File in New Tab" }, -- Space after 'tabedit' for file path input
      m = { "<cmd>tabmove ", "Move Tab" }, -- Space after 'tabmove' for position input
      -- r = { "<cmd>tabrewind<cr>", "Rewind to First Tab" },
      d = { "<cmd>tabdo ", "Execute Command on All Tabs" }, -- Space after 'tabdo' for command input
      l = { "<cmd>tabs<cr>", "List All Tabs" }, -- Capital T to avoid conflict with 't' for 'tabs'
      E = { "<cmd>tabedit<cr>", "Edit New File in New Tab" }, -- Another variant for 'Edit File in New Tab'
      F = { "<cmd>tabfind ", "Find and Edit File in New Tab" }, -- Space after 'tabfind' for file path input
      M = { "<cmd>tabmove<cr>", "Move Current Tab" }, -- Another variant for 'Move Tab'
      -- Note: 'tabNext' is intentionally omitted as it's likely a typo or less commonly used variant of 'tabnext'
      ["0"] = { "<cmd>tabfirst<cr>", "Switch to first tab" },
      ["1"] = { "<cmd>tabn 1<cr>", "Switch to tab 1" },
      ["2"] = { "<cmd>tabn 2<cr>", "Switch to tab 2" },
      ["3"] = { "<cmd>tabn 3<cr>", "Switch to tab 3" },
      ["4"] = { "<cmd>tabn 4<cr>", "Switch to tab 4" },
      ["5"] = { "<cmd>tabn 5<cr>", "Switch to tab 5" },
      ["6"] = { "<cmd>tabn 6<cr>", "Switch to tab 6" },
      ["7"] = { "<cmd>tabn 7<cr>", "Switch to tab 7" },
      ["8"] = { "<cmd>tabn 8<cr>", "Switch to tab 8" },
      ["9"] = { "<cmd>tablast<cr>", "Switch to last tab" },
    },
    --
    -- windows
    --
    w = {
      name = "windows",
      c = { "<cmd>close<cr>", "Close Window" },
      d = { "<cmd>close<cr>", "Close Window" },
      O = { "<cmd>only<cr>", "Close Other Windows" },
      s = {
        name = "splits",
        h = { "<cmd>split<cr>", "Horizontal Split" },
        v = { "<cmd>vsplit<cr>", "Vertical Split" },
      },
      w = { "<cmd>wincmd w<cr>", "Next Window" },
      W = { "<cmd>wincmd W<cr>", "Previous Window" },
      n = { "<cmd>wincmd w<cr>", "Next Window" },
      p = { "<cmd>wincmd W<cr>", "Previous Window" },
      h = { "<cmd>wincmd h<cr>", "Move to Left Window" },
      j = { "<cmd>wincmd j<cr>", "Move to Lower Window" },
      k = { "<cmd>wincmd k<cr>", "Move to Upper Window" },
      l = { "<cmd>wincmd l<cr>", "Move to Right Window" },
      H = { "<cmd>wincmd H<cr>", "Move Window Left" },
      J = { "<cmd>wincmd J<cr>", "Move Window Down" },
      K = { "<cmd>wincmd K<cr>", "Move Window Up" },
      L = { "<cmd>wincmd L<cr>", "Move Window Right" },
      ["<C-W>"] = {
        name = "resize",
        H = { "<cmd>vertical resize -5<cr>", "Decrease Width" },
        J = { "<cmd>resize +5<cr>", "Increase Height" },
        K = { "<cmd>resize -5<cr>", "Decrease Height" },
        L = { "<cmd>vertical resize +5<cr>", "Increase Width" },
      },
      -- Additional window commands
      e = { "<cmd>wincmd =<cr>", "Equalize Window Sizes" },
      r = { "<cmd>wincmd r<cr>", "Rotate Windows Downwards/Right" },
      R = { "<cmd>wincmd R<cr>", "Rotate Windows Upwards/Left" },
      x = { "<cmd>wincmd x<cr>", "Exchange Current Window with Next" },
      T = { "<cmd>wincmd T<cr>", "Break Out Into New Tab" },
      -- Note: You can add more window-related commands as needed
    },
    --
    -- buffers
    --
    b = {
      name = "buffers",
      n = { "<cmd>bnext<cr>", "Next Buffer" },
      p = { "<cmd>bprevious<cr>", "Previous Buffer" },
      d = { "<cmd>bdelete<cr>", "Delete Buffer" },
      D = { "<cmd>bdelete!<cr>" },
      A = { "<cmd>ball<cr>", "Show All Buffers" },
      W = { "<cmd>bwipeout<cr>", "Wipeout Buffer" },
      ["#"] = { "<cmd>buffer ", "Switch to buffer given" },
      ["0"] = { "<cmd>bfirst<cr>", "Switch to first Buffer" },
      ["1"] = { "<cmd>buffer 1<cr>", "Switch to Buffer 1" },
      ["2"] = { "<cmd>buffer 2<cr>", "Switch to Buffer 2" },
      ["3"] = { "<cmd>buffer 3<cr>", "Switch to Buffer 3" },
      ["4"] = { "<cmd>buffer 4<cr>", "Switch to Buffer 4" },
      ["5"] = { "<cmd>buffer 5<cr>", "Switch to Buffer 5" },
      ["6"] = { "<cmd>buffer 6<cr>", "Switch to Buffer 6" },
      ["7"] = { "<cmd>buffer 7<cr>", "Switch to Buffer 7" },
      ["8"] = { "<cmd>buffer 8<cr>", "Switch to Buffer 8" },
      ["9"] = { "<cmd>blast<cr>", "Switch to last buffer" },
      f = { "<cmd>bufdo ", "Execute Command on Buffers" }, -- Space after 'bufdo' for command input
      l = { "<cmd>buffers<cr>", "List Buffers" },
      b = { "<cmd>bfirst<cr>", "First Buffer" },
      B = { "<cmd>blast<cr>", "Last Buffer" },
      r = { "<cmd>brewind<cr>", "Rewind to First Buffer" },
      m = { "<cmd>bmodified<cr>", "List Modified Buffers" },
      u = { "<cmd>bunload<cr>", "Unload Buffer" },
      a = { "<cmd>badd ", "Add New Buffer" }, -- Space after 'badd' for file path input
      R = { "<cmd>bufdo bdelete<cr>", "Delete All Buffers" },
      T = { "<cmd>tab ball<cr>", "Open All Buffers in Tabs" },
      -- e buffer explorer
      -- o only
      -- p pin
      -- P delete non-pinned
    },
    T = {
      name = "open",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      g = { "<cmd>Telescope live_grep<cr>", "Find String" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      t = { "<cmd>Telescope tags<cr>", "Find Tag" },
      T = { "<cmd>Telescope treesitter<cr>", "Find Treesitter" },
      m = { "<cmd>Telescope marks<cr>", "Find Mark" },
      c = { "<cmd>Telescope commands<cr>", "Find Command" },
      q = { "<cmd>Telescope quickfix<cr>", "Find Quickfix" },
      n = { "<cmd>Telescope noice<cr>" },
    },
    O = {
      c = { "<cmd>copen<cr>" },
    },
    c = {
      c = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
        g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
        t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
        k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
        d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
        a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
        o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
        s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
        f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
        x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
        r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
        l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
      },
    },
  },
})
