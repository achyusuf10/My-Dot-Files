local hotkeys_popup = require("awful.hotkeys_popup.widget")

local kitty = {}

--- Add rules to match kitty session.
--
-- For example:
--
--     kitty.add_rules_for_terminal({ rule = { name = { "kitty" }}})
--
-- will show kitty hotkeys for any window that has 'kitty' in its title.
-- If no rules are provided then kitty hotkeys will be shown always!
-- @function add_rules_for_terminal
-- @see ruled.client.rules
-- @tparam table rule Rules to match a window containing a kitty session.
function kitty.add_rules_for_terminal(rule)
    for group_name, group_data in pairs({
        ["kitty: Window Management"] = rule,
        ["kitty: Tab Management"]  = rule,
    }) do
        hotkeys_popup.add_group_rules(group_name, group_data)
    end
end

local kitty_keys = {
    ["kitty: Window Management"] = {
    {
        modifiers = {"Control","Shift"},
        keys = {
            Enter = "new window",
            w     = "close window",
            j     = "previous window",
            k     = "next window",
            Up    = "move window forward",
            Down  = "move window backward",
        }
    },
    {
        modifiers = {},
        keys = {
            ['']     = "",
            
        }
    },
},

["kitty: Tab Management"] = {
    {
        modifiers = {"Control","Shift"},
        keys = {
            t     = "new tab",
            [']'] = "next tab",
            ['['] = "previous tab",
            Left  = "move tab backward",
            Right = "move tab forward",
            
        }
    },
    
},
    
}

hotkeys_popup.add_hotkeys(kitty_keys)

return kitty
