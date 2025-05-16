return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	lazy = false,
	keys = {
		-- { "<Leader>z", "<cmd>:NoNeckPain<CR>", noremap = true, silent = true },
	},
	init = function()
		local state = {}
		local config = {
			width = 180,
			integrations = {
				trouble = { position = "bottom", fileType = "trouble" },
				fugitive = { position = "top", fileType = "fugitive" },
				NeoTree = {
					position = "left",
					fileType = "neo-tree",
					cmd = function()
						vim.cmd("Neotree close")
					end,
				},
				DBUI = { position = "left", fileType = "dbui", cmd = vim.cmd.DBUIClose },
				undotree = { position = "left", fileType = "undotree", cmd = vim.cmd.UndotreeHide },
				neotest = {
					position = "right",
					fileType = "neotest-summary",
					cmd = function()
						vim.cmd("Neotest summary close")
					end,
				},
				-- TSPlayground = { position = "right", fileType = "undotree" },
				NvimDAPUI = {
					position = "right",
					fileType = "dapui_scopes",
					cmd = function()
						require("dapui").close()
					end,
				},
			},
		}

		local function create_window(position)
			if position == "left" then
				vim.cmd("topleft vnew")
			elseif position == "right" then
				vim.cmd("botright vnew")
			end

			vim.api.nvim_win_set_config(0, { width = math.floor((vim.o.columns - config.width) / 2) })
			vim.api.nvim_win_set_option(0, "winfixwidth", true)
			vim.api.nvim_win_set_option(0, "cursorline", false)

			vim.api.nvim_buf_set_option(0, "filetype", "no-neck-pain-" .. position)
			vim.api.nvim_buf_set_option(0, "buftype", "nofile")

			vim.api.nvim_buf_set_option(0, "number", false)
			vim.api.nvim_buf_set_option(0, "relativenumber", false)
			vim.api.nvim_buf_set_option(0, "buflisted", false)

			return vim.api.nvim_get_current_win()
		end

		local function get_side_buffer(position)
			local current_tabpage = vim.api.nvim_get_current_tabpage()
			if state[current_tabpage] and state[current_tabpage][position] then
				return state[current_tabpage][position]
			end
			return -1
		end

		local function close_side_buffer(position)
			local window = get_side_buffer(position)
			if window and vim.api.nvim_win_is_valid(window) then
				local buffer = vim.api.nvim_win_get_buf(window)
				vim.api.nvim_win_close(window, true)

				if vim.api.nvim_buf_is_valid(buffer) then
					vim.api.nvim_buf_delete(buffer, { force = true })
				end
			end
		end

		local function filetypes_visible(filetypes)
			for _, win_id in ipairs(vim.api.nvim_list_wins()) do
				local buf_id = vim.api.nvim_win_get_buf(win_id)
				if vim.api.nvim_buf_is_valid(buf_id) and vim.api.nvim_buf_is_loaded(buf_id) then
					if vim.tbl_contains(filetypes, vim.api.nvim_buf_get_option(buf_id, "filetype")) then
						return true
					end
				end
			end
			return false
		end

		local function remove_file_type(file_types, type_to_remove)
			for i, file_type in ipairs(file_types) do
				if file_type == type_to_remove then
					table.remove(file_types, i)
					break
				end
			end
		end

		local function is_buff_integration(buf)
			local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
			for _, integration in pairs(config.integrations) do
				if filetype == integration.fileType then
					return true
				end
			end
			return false
		end

		local function get_editable_files()
			local editable_files = {}
			local windows = vim.api.nvim_list_wins()
			for _, win in ipairs(windows) do
				local buf = vim.api.nvim_win_get_buf(win)
				local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
				if buftype == "" then -- is an actual file
					editable_files[buf] = buf
				end
			end
			return editable_files
		end

		local function get_vsplits()
			local vsplits = {}
			local windows = vim.api.nvim_list_wins()
			for _, win in ipairs(windows) do
				local buf = vim.api.nvim_win_get_buf(win)
				local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
				local total_width = vim.o.columns
				local window_width = vim.api.nvim_win_get_width(win)
				if buftype == "" and window_width < total_width then -- is an actual file
					vsplits[buf] = buf
				end
			end
			return vsplits
		end

		local function is_hsplit(buf)
			local win_id = vim.fn.bufwinid(buf)
			local width = vim.api.nvim_win_get_width(win_id)
			local height = vim.api.nvim_win_get_height(win_id)
			return width > height
		end

		local function is_integration_open(position)
			for _, integration in pairs(config.integrations) do
				if integration.position == position then
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if
							vim.api.nvim_buf_is_loaded(buf)
							and vim.api.nvim_buf_get_option(buf, "filetype") == integration.fileType
						then
							return true
						end
					end
				end
			end
			return false
		end

		local function is_popup_window(win_id)
			return vim.api.nvim_win_get_config(win_id).relative ~= ""
		end

		local function get_window_by_filetype(target_filetype)
			for _, win_id in ipairs(vim.api.nvim_list_wins()) do
				local buf_id = vim.api.nvim_win_get_buf(win_id)
				local buf_filetype = vim.api.nvim_buf_get_option(buf_id, "filetype")
				if buf_filetype == target_filetype then
					return win_id
				end
			end
			return nil
		end

		local function adjust_top_bottom_window(target_window, position)
			if target_window then
				vim.api.nvim_win_call(target_window, function()
					vim.cmd("wincmd " .. position)
				end)
			end
		end

		local function adjust_side_buffers()
			local new_width = math.floor((vim.o.columns - config.width) / 2)
			local left = vim.api.nvim_win_is_valid(get_side_buffer("left"))
			if left then
				vim.api.nvim_win_set_width(get_side_buffer("left"), new_width)
			end
			local right = vim.api.nvim_win_is_valid(get_side_buffer("right"))
			if right then
				vim.api.nvim_win_set_width(get_side_buffer("right"), new_width)
			end
		end

		local function has_window_relative(current_win, direction)
			local wins = vim.api.nvim_tabpage_list_wins(0) -- List all windows in the current tabpage
			local current_pos = vim.api.nvim_win_get_position(current_win)
			local current_row = current_pos[1] -- Get the row position of the current window

			for _, win in ipairs(wins) do
				local pos = vim.api.nvim_win_get_position(win)
				if direction == "above" and pos[1] < current_row then
					return true
				elseif direction == "below" and pos[1] > current_row then
					return true
				end
			end
			return false
		end

		vim.api.nvim_create_autocmd({ "VimEnter", "TabNew" }, {
			callback = function()
				-- disable when window is too small
				if vim.o.columns <= config.width then
					return
				end

				state[vim.api.nvim_get_current_tabpage()] = {
					left = create_window("left"),
					right = create_window("right"),
				}
				vim.cmd("wincmd h")
			end,
			desc = "Restore the last buffer when opening Neovim",
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				if vim.bo.filetype == "no-neck-pain-left" then
					vim.cmd("wincmd l")
				end
				if vim.bo.filetype == "no-neck-pain-right" then
					vim.cmd("wincmd h")
				end
			end,
			desc = "Prevent the cursor from moving to the side buffers.",
		})

		vim.api.nvim_create_autocmd({ "QuitPre" }, {
			callback = function(args)
				if vim.tbl_count(get_editable_files()) == 1 and not is_buff_integration(args.buf) then
					close_side_buffer("left")
					close_side_buffer("right")
					for _, integration in pairs(config.integrations) do
						pcall(integration.cmd)
					end
					-- require("auto-session").SaveSession(nil, false)
				end
			end,
			desc = "Close left and right buffers on quit",
		})

		vim.api.nvim_create_autocmd("VimResized", {
			callback = function()
				if vim.tbl_count(get_editable_files()) ~= 1 then
					return
				end

				-- close when window is too small
				if vim.o.columns <= config.width then
					close_side_buffer("left")
					close_side_buffer("right")
					return
				end

				-- enable when side buffers is big enough
				local left = vim.api.nvim_win_is_valid(get_side_buffer("left"))
				if not left and not is_integration_open("left") then
					state[vim.api.nvim_get_current_tabpage()].left = create_window("left")
					vim.cmd("wincmd l")
				end

				local right = vim.api.nvim_win_is_valid(get_side_buffer("right"))
				if not right and not is_integration_open("right") then
					state[vim.api.nvim_get_current_tabpage()].right = create_window("right")
					vim.cmd("wincmd h")
				end
				adjust_side_buffers()
			end,
			desc = "Resizes side windows after terminal has been resized, closes them if not enough space left.",
		})

		vim.api.nvim_create_autocmd("WinClosed", {
			pattern = "*",
			callback = function(args)
				-- do not recreate when window is too small
				if vim.o.columns <= config.width then
					return
				end
				local win_id = tonumber(args.match)
				if win_id == nil then
					return
				end

				if is_popup_window(win_id) then
					return
				end

				local buf_id = vim.fn.winbufnr(win_id)
				local file_type = vim.api.nvim_buf_get_option(buf_id, "filetype")
				local buf_type = vim.api.nvim_buf_get_option(buf_id, "buftype")

				-- do not recreate when multiple vsplits are active
				local count = vim.tbl_count(get_vsplits())
				if buf_type == "" then
					count = count - 1
				end
				if count >= 2 then
					return
				end

				local left_file_types = { "neo-tree", "undotree", "dbui", "no-neck-pain-left" }
				remove_file_type(left_file_types, file_type)
				if not filetypes_visible(left_file_types) then
					state[vim.api.nvim_get_current_tabpage()].left = create_window("left")
					vim.cmd("wincmd l")
				end

				local right_file_types = { "dapui_scopes", "neotest-summary", "no-neck-pain-right" }
				remove_file_type(right_file_types, file_type)
				if not filetypes_visible(right_file_types) then
					state[vim.api.nvim_get_current_tabpage()].right = create_window("right")
					vim.cmd("wincmd h")
				end

				for _, integration in pairs(config.integrations) do
					local target_window = get_window_by_filetype(integration.fileType)
					if integration.position == "top" and not has_window_relative(target_window, "above") then
						adjust_top_bottom_window(target_window, "K")
					end
					if integration.position == "bottom" and not has_window_relative(target_window, "below") then
						adjust_top_bottom_window(target_window, "J")
					end
				end
				adjust_side_buffers()
			end,
			desc = "Recreate the side buffers if they are closed.",
		})

		vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
			pattern = "*",
			callback = function(args)
				if is_popup_window(vim.api.nvim_get_current_win()) then
					return
				end
				local filetype = vim.bo[args.buf].filetype
				local is_integration = is_buff_integration(args.buf)
				if args.event == "BufWinEnter" then
					if filetype ~= "" and not is_integration and vim.tbl_count(get_vsplits()) >= 2 then
						close_side_buffer("left")
						close_side_buffer("right")
						return
					end
				end

				if not is_integration then
					return
				end

				for _, integration in pairs(config.integrations) do
					if filetype == integration.fileType then
						close_side_buffer(integration.position)
						for _, integrate in pairs(config.integrations) do
							if integrate.position == integration.position and filetype ~= integrate.fileType then
								pcall(integrate.cmd)
							end
						end
					end

					local target_window = get_window_by_filetype(integration.fileType)
					if integration.position == "top" and not is_hsplit(args.buf) then
						adjust_top_bottom_window(target_window, "K")
					end
					if integration.position == "bottom" and not is_hsplit(args.buf) then
						adjust_top_bottom_window(target_window, "J")
					end
				end

				if is_integration then
					vim.api.nvim_win_set_width(vim.api.nvim_get_current_win(), 64)
				end

				adjust_side_buffers()
			end,
			desc = "Close side buffer plugins if another plugin is already occupying that side.",
		})
	end,
}
