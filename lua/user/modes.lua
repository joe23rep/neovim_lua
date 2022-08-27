require('modes').setup({
	colors = {
		copy   = "#00d5ff",
		delete = "#00d5ff",
		-- insert = "#6ca3bb",
		insert = "#5883bb",
		visual = "#6d7d7f",
	},

	-- Set opacity for cursorline and number background
	line_opacity = 0.25,

	-- Enable cursor highlights
	set_cursor = true,

	-- Enable cursorline initially, and disable cursorline for inactive windows
	-- or ignored filetypes
	set_cursorline = true,

	-- Enable line number highlights to match cursorline
	set_number = true,

	-- Disable modes highlights in specified filetypes
	-- Please PR commonly ignored filetypes
	ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
})
