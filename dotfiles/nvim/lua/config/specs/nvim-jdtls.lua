return {
	"mfussenegger/nvim-jdtls",
	ft = "java", -- Solo carga el plugin para archivos Java
	config = function()
		-- Aquí va la configuración específica de nvim-jdtls
		local home = os.getenv("HOME")
		local jdtls_home = home .. "/.local/share/nvim/mason/packages/jdtls"
		local java_bin = home .. "/.asdf/installs/java/openjdk-17.0.2/bin/java"
		local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

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
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				jdtls_home .. "/config_linux",
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-11",
								path = home .. "/.asdf/installs/java/openjdk-11.0.2/bin/java",
							},
							{
								name = "JavaSE-17",
								path = home .. "/.asdf/installs/java/openjdk-17.0.2/bin/java",
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

		-- Iniciar o conectar con jdtls
		require("jdtls").start_or_attach(config)

		-- Mapeos de teclas para jdtls
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>oi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>ev", "<Cmd>lua require'jdtls'.extract_variable()<CR>", opts)
		vim.api.nvim_set_keymap("v", "<leader>ev", "<Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>ec", "<Cmd>lua require'jdtls'.extract_constant()<CR>", opts)
		vim.api.nvim_set_keymap("v", "<leader>ec", "<Esc><Cmd>lua require'jdtls'.extract_constant(true)<CR>", opts)
	end,
}
