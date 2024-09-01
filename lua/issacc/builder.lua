local workingDir = vim.fn.getcwd()

SetBuildConfig = function ()
	local path = vim.fs.joinpath(workingDir, "build.lua")

	local build = dofile(path)
	if build.run ~= nil then
		if type(build.run) == "string" then
			vim.cmd.terminal(build.run)
		elseif type(build.run) == "function" then
			build.run()
		end
	end
end

local wk = require("which-key")
wk.add({
	{"<leader>b", desc = "Run build.lua"}
}, {})

vim.keymap.set("n", "<leader>b", function() SetBuildConfig() end)
