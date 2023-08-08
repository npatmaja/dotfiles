local kiroku= {}

local config = {
	home = "~/kiroku",
	template = [[
---
title:
tags:
	- "#your-tag"
---

## References

## Backlinks

<!-- external links -->


]],
	file = {
		pattern = function()
			return os.date("%Y%m%d%H%M")
		end,
		extention = '.md',
		type = 'markdown'
	}
}

function kiroku.newKiroku()
	local current_time = config.file.pattern()
	local file_name = current_time .. config.file.extention
	-- local file = io.open(file_name, "w")

	-- file:write(config.template)
	-- file:close()
	-- Check if a tab is already open

	-- local currentTab = vim.fn.tabpagenr()
	-- local totalTabs = vim.fn.tabpagenr("$")
	-- Check if the current buffer is empty
	local isEmpty = vim.api.nvim_buf_line_count(0) <= 1 and vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == ""
	-- print('currentTab: ' .. currentTab .. ' totalTabs: ' .. totalTabs)
	if isEmpty == false then
		vim.cmd('enew')
	end

	vim.api.nvim_buf_set_name(0, file_name)
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(config.template, "\n"))
	-- Set the file type to Markdown
	vim.api.nvim_buf_set_option(0, "filetype", config.file.type)
	-- vim.cmd('tabnew')
	-- vim.cmd('tabnext')

	print("A new kiroku created: " .. file_name)
end

-- create command
vim.api.nvim_create_user_command('Kiroku', function(args)
	if args.fargs[1] == 'new' then
		kiroku.newKiroku()
	end
end, {
	range = true,
	nargs = '+'
})

return kiroku
