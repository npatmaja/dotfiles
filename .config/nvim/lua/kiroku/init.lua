local kiroku = {}

local config = {
	home = os.getenv("HOME") .. "/kiroku",
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

function kiroku.format_cmp(entry, vim_item)
	-- local kiroku_home = os.getenv("HOME") .. "/kiroku-copy"
	local cwd = vim.fn.getcwd()
	local is_markdown = entry.context.filetype == "markdown"

	if config.home == cwd and is_markdown and entry.completion_item.detail ~= nil then
		-- get the front matter
		local file = io.open(entry.completion_item.detail, "r")
		if file == nil then
			return vim_item
		end
		local title = ""
		if file then
			local frontmatter = true
			local frontmatter_line_count = 0
			while frontmatter do
				local line = file:read("*l")
				if line == nil then
					break
				end
				if line == "---" then
					frontmatter_line_count = frontmatter_line_count + 1
				end
				if frontmatter_line_count >= 2 then
					frontmatter = false
				end
				if string.sub(line, 1, 6) == "title:" then
					title = "(" .. string.sub(line, 8, string.len(line)) .. ")"
				end
			end
		end
		file:close()

		local menu = ""
		if vim_item.menu ~= nil then
			menu = vim_item.menu
		end
		vim_item.menu = menu .. title
	end
	return vim_item
end

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
