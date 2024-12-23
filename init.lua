--- ShiftyEscape
---
--- Make the `shift` key more useful: If the `shift` key is tapped, treat it
--- as the `escape` key. If the `shift` key is held down and used in
--- combination with another key, then provide the normal `shift` key
--- behavior.

local obj = {}
obj.__index = obj

-- Metadata
obj.name = 'ShiftyEscape'
obj.version = '0.2.0'
obj.author = 'Dan Dee <monkeyjunglejuice@pm.me>'
obj.homepage = 'https://github.com/monkeyjunglejuice/ShiftyEscape.spoon'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

function obj:init()
  self.sendEscape = false
  self.lastModifiers = {}

  -- If `shift` is held for this long, don't send `escape`
  local CANCEL_DELAY_SECONDS = 0.200 -- default 0.150
  self.shiftKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function()
    self.sendEscape = false
  end)

  -- Create an eventtap to run each time the modifier keys change (i.e., each
  -- time a key like shift, shift, option, or control is pressed or released)
  self.shiftTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged },
    function(event)
      local newModifiers = event:getFlags()

      -- If this change to the modifier keys does not invole a *change* to the
      -- up/down state of the `shift` key (i.e., it was up before and it's
      -- still up, or it was down before and it's still down), then don't take
      -- any action.
      if self.lastModifiers['shift'] == newModifiers['shift'] then
        return false
      end

      -- If the `shift` key has changed to the down state, then start the
      -- timer. If the `shift` key changes to the up state before the timer
      -- expires, then send `escape`.
      if not self.lastModifiers['shift'] then
        self.lastModifiers = newModifiers
        self.sendEscape = true
        self.shiftKeyTimer:start()
      else
        if self.sendEscape then
          hs.eventtap.keyStroke({}, 'escape', 1)
        end
        self.lastModifiers = newModifiers
        self.shiftKeyTimer:stop()
      end
      return false
    end
  )

  -- Create an eventtap to run each time a normal key (i.e., a non-modifier key)
  -- enters the down state. We only want to send `escape` if `shift` is
  -- pressed and released in isolation. If `shift` is pressed in combination
  -- with any other key, we don't want to send `escape`.
  self.keyDownEventTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown },
    function(event)
      self.sendEscape = false
      return false
    end
  )
end

--- ShiftyEscape:start()
--- Method
--- Start sending `escape` when `shift` is pressed and released in isolation
function obj:start()
  self.shiftTap:start()
  self.keyDownEventTap:start()
end

--- ShiftyEscape:stop()
--- Method
--- Stop sending `escape` when `shift` is pressed and released in isolation
function obj:stop()
  -- Stop monitoring keystrokes
  self.shiftTap:stop()
  self.keyDownEventTap:stop()

  -- Reset state
  self.shiftKeyTimer:stop()
  self.sendEscape = false
  self.lastModifiers = {}
end

return obj
