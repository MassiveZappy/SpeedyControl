require "util"

function ui()
	for playerIndex, player in pairs(game.players) do
		if player.gui.top.decrease2 == nil then
			player.gui.top.add{name = "decrease2", type = "button", caption = "<", style="sc_fentus_button"}
		end

		if player.gui.top.decrease == nil then
			player.gui.top.add{name = "decrease", type = "button", caption = "<<", style="sc_fentus_button"}
		end

		if player.gui.top.decrease1 == nil then
			player.gui.top.add{name = "decrease1", type = "button", caption = "<<<", style="sc_fentus_button"}
		end

		if player.gui.top.display == nil then
			player.gui.top.add{name = "display", type = "label", caption = "Speed "..tostring(format_num(game.speed,2,"x","")), style="fentus_label"}
		end

		if player.gui.top.increase1 == nil then
			player.gui.top.add{name = "increase1", type = "button", caption = ">>>", style="sc_fentus_button"}
		end

		if player.gui.top.increase == nil then
			player.gui.top.add{name = "increase", type = "button", caption = ">>", style="sc_fentus_button"}
		end

		if player.gui.top.increase2 == nil then
			player.gui.top.add{name = "increase2", type = "button", caption = ">", style="sc_fentus_button"}
		end
	end
end

script.on_configuration_changed(function(_)
    ui()
end)

script.on_event(defines.events, function(event)
	if event.name == defines.events.on_player_joined_game then
		ui()
	end

	-- on_gui_click
	if event.name == defines.events.on_gui_click then
		if event.element.name == "decrease2" then
			speed(-0.1)
		end

		if event.element.name == "decrease" then
			speed(-1)
		end

		if event.element.name == "decrease1" then
			speed(-10)
		end

		if event.element.name == "increase1" then
			speed(10)
		end

		if event.element.name == "increase" then
			speed(1)
		end

		if event.element.name == "increase2" then
			speed(0.1)
		end
	end
end)

function speed(adjust)
    game.speed = math.clamp(game.speed + adjust, 0.1, 10000)

	for playerIndex, player in pairs(game.players) do
		if player.gui.top.decrease then
			player.gui.top.display.caption = "Speed "..tostring(format_num(game.speed,2,"x",""))
		end
	end
end

function format_num(amount, decimal, prefix, neg_prefix)
  local str_amount,  formatted, famount, remain

  decimal = decimal or 2
  neg_prefix = neg_prefix or "-"

  famount = math.abs(round(amount,decimal))
  famount = math.floor(famount)

  remain = round(math.abs(amount) - famount, decimal)

  formatted = comma_value(famount)

  if (decimal > 0) then
    remain = string.sub(tostring(remain),3)
    formatted = formatted .. "." .. remain ..
                string.rep("0", decimal - string.len(remain))
  end

  formatted = (prefix or "") .. formatted

  if (amount<0) then
    if (neg_prefix=="()") then
      formatted = "("..formatted ..")"
    else
      formatted = neg_prefix .. formatted
    end
  end

  return formatted
end

function round(val, decimal)
  if (decimal) then
    return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
  else
    return math.floor(val+0.5)
  end
end

function comma_value(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function math.clamp(val, lower, upper)
    if lower > upper then
		lower, upper = upper, lower
	end

    return math.max(lower, math.min(upper, val))
end

script.on_event("decrease2", function(event) return speed(-0.1) end)
script.on_event("decrease", function(event) return speed(-1) end)
script.on_event("decrease1", function(event) return speed(-10) end)
script.on_event("increase1", function(event) return speed(10) end)
script.on_event("increase", function(event) return speed(1) end)
script.on_event("increase2", function(event) return speed(0.1) end)
