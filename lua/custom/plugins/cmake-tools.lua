return {
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'akinsho/toggleterm.nvim', version = '*', config = true },
    },
  },
  {
    require('lspconfig').clangd.setup {
      on_new_config = function(new_config, new_cwd)
        local status, cmake = pcall(require, 'cmake-tools')
        if status then
          cmake.clangd_on_new_config(new_config)
        end
      end,
    },
  },
}
