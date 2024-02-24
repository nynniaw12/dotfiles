require("obsidian").setup({
    workspaces = {
        {
            name = "aybars-main",
            path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/aybars-main"
        },
    },
    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
    new_notes_location = "current_dir",
    wiki_link_func = function(opts)
        if opts.id == nil then
            return string.format("[[%s]]", opts.label)
        elseif opts.label ~= opts.id then
            return string.format("[[%s|%s]]", opts.id, opts.label)
        else
            return string.format("[[%s]]", opts.id)
        end
    end,

    mappings = {
        -- "Obsidian follow"
        ["<leader>of"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes "obsidian done"
        ["<leader>od"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
        -- Create a new newsletter issue
        ["<leader>onn"] = {
            action = function()
                return require("obsidian").commands.new_note("Newsletter-Issue")
            end,
            opts = { buffer = true },
        },
        ["<leader>ont"] = {
            action = function()
                return require("obsidian").util.insert_template("Newsletter-Issue")
            end,
            opts = { buffer = true },
        },
    },

    note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
                out[k] = v
            end
        end
        return out
    end,


    templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        tags = "",
    },
})
