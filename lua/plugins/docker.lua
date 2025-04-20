return {
  {
    "dgrbrady/nvim-docker",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    config = function()
      local nvim_docker = require("nvim-docker")
      -- setting up keybindings since the `list_containers` fn does not have a default binding
      vim.keymap.set("n", "<leader>C", nvim_docker.containers.list_containers)
    end,
  },
}
