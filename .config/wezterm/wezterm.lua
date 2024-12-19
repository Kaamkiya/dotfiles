local wezterm = require 'wezterm'

local config = {}

-- Font config
config.font = wezterm.font 'JetBrainsMono NerdFont'
config.font_size = 10.0

config.color_scheme = 'Catppuccin Mocha'

-- Tab bar config
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local title = tab.tab_title
        if #title < 1 then
            title = tab.active_pane.title
        end

        title = wezterm.truncate_right(title, max_width)

        local background = '#11111b'
        local foreground = '#b4befe'
        if tab.is_active then
            background = '#b4befe'
            foreground = '#11111b'
        elseif hover then
            background = '#1e1e2e'
            foreground = '#b4befe'
        end

        local right_tri = ''
        if tab.is_active then
            right_tri = wezterm.nerdfonts.pl_left_hard_divider
        end

        return {
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = ' ' .. title .. ' ' },
            { Background = { Color = '#11111b' } },
            { Foreground = { Color = background } },
            { Text = right_tri },
        }
    end
)

-- Command palette config
config.command_palette_bg_color = '#11111b'
config.command_palette_fg_color = '#b4befe'
config.command_palette_font_size = 10
config.command_palette_rows = 4

return config
