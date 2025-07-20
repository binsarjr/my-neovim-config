return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    build = ":AvanteBuild", -- This is optional, recommended tho. Also note that this will block the startup for a bit since we are compiling bindings in Rust.
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- i'm using supermaven
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      -- Default provider for new chats / planning
      provider = "moonshot",

      providers = {
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          api_key_name = "MOONSHOT_API_KEY", -- env var name
          timeout = 30000, -- ms
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
      },

      -- Optional: use Kimi for inline auto-suggestions as well
      auto_suggestions_provider = "moonshot",

      -- everything else is stock – tweak to taste
      behaviour = {
        auto_suggestions = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
      },
    },
  },
}
