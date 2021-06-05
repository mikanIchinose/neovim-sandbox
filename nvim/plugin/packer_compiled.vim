" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/neovim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/neovim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/neovim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/neovim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/neovim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["caw.vim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/caw.vim"
  },
  ["cosco.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/opt/cosco.vim"
  },
  ["defx-git"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/defx-git"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/defx-icons"
  },
  ["defx.nvim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/defx.nvim"
  },
  ["denite.nvim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/denite.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["vim-paste-easy"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-paste-easy"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/neovim/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cosco.vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'cosco.vim'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'cosco.vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'cosco.vim'}, { ft = "rust" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
