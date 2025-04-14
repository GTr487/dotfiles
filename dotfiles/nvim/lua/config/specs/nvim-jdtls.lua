return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local home = os.getenv("HOME")
    local jdtls_home = home .. "/.local/share/nvim/mason/packages/jdtls"
    local java_bin = home .. "/.asdf/installs/java/openjdk-17.0.2/bin/java"

    -- Autocmd que arranca JDTLS solo cuando se abre un archivo Java
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local jdtls = require("jdtls")

        -- Detectar root del proyecto (por git, Maven, Gradle, etc.)
        local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

        -- Workspace basado en el nombre del directorio raíz del proyecto
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

        local config = {
          cmd = {
            java_bin,
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-javaagent:" .. home .. "/.local/share/nvim/lombok/lombok.jar", -- Lombok
            "-Xms1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", vim.fn.glob(jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration", jdtls_home .. "/config_linux",
            "-data", workspace_dir,
          },
          root_dir = root_dir,
          settings = {
            java = {
              configuration = {
                runtimes = {
                  {
                    name = "JavaSE-11",
                    path = home .. "/.asdf/installs/java/openjdk-11.0.2",
                  },
                  {
                    name = "JavaSE-17",
                    path = home .. "/.asdf/installs/java/openjdk-17.0.2",
                  },
                },
              },
              format = {
                enabled = true,
                settings = {
                  profile = "GoogleStyle",
                  url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                },
              },
            },
          },
          init_options = {
            bundles = {},
          },
        }

        jdtls.start_or_attach(config)
        jdtls.setup.add_commands()

        -- Keymaps
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set("n", "<leader>oi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
        vim.keymap.set("n", "<leader>ev", "<Cmd>lua require'jdtls'.extract_variable()<CR>", opts)
        vim.keymap.set("v", "<leader>ev", "<Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR>", opts)
        vim.keymap.set("n", "<leader>ec", "<Cmd>lua require'jdtls'.extract_constant()<CR>", opts)
        vim.keymap.set("v", "<leader>ec", "<Esc><Cmd>lua require'jdtls'.extract_constant(true)<CR>", opts)
      end,
    })
  end,
}
