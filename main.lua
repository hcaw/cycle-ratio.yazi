--- @sync entry

local function entry(state)
	if not state.cycle then
		-- First invocation: Save original layout and set middle column to 100%
		state.original = Tab.layout
		state.cycle = 1
		Tab.layout = function(self)
			self._chunks = ui.Layout()
					:direction(ui.Layout.HORIZONTAL)
					:constraints({
						ui.Constraint.Percentage(0),
						ui.Constraint.Percentage(50),
						ui.Constraint.Percentage(50),
					})
					:split(self._area)
		end
	elseif state.cycle == 1 then
		-- Second invocation: Set 50-50 split between middle and right columns
		state.cycle = 2
		Tab.layout = function(self)
			self._chunks = ui.Layout()
					:direction(ui.Layout.HORIZONTAL)
					:constraints({
						ui.Constraint.Percentage(0),
						ui.Constraint.Percentage(100),
						ui.Constraint.Percentage(0),
					})
					:split(self._area)
		end
	else
		-- Third invocation: Restore original layout
		Tab.layout = state.original
		state.original = nil
		state.cycle = nil
	end
	ya.app_emit("resize", {})
end

local function enabled(state)
	return state.original ~= nil
end

return { entry = entry, enabled = enabled }
