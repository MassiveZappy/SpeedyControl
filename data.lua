data:extend(
    {
        {
            type = "font",
            name = "fentus_font",
            from = "default-bold",
            size = 16
        }
    }
)

data.raw["gui-style"].default["sc_fentus_button"]  =
{
	type = "button_style",
	font = "fentus_font",
	font_color = {r = 0.2, g = 0.3, b = 1},
	parent = "button",
	default_graphical_set =
	{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {2, 2},
		position = {8, 0}
	},
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,

	maximal_width = 35,
	minimal_width = 35,

	left_click_sound =
	{
		{
			filename = "__core__/sound/gui-click.ogg",
			volume = 1
		}
	},

}

data.raw["gui-style"].default["fentus_label"] =
{
	type = "label_style",
	font = "fentus_font",
	font_color = {r = 0.2, g = 0.3, b = 1},
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
}

data:extend({
  {
    type = "custom-input",
    name = "decrease2",
    key_sequence = "ALT + MINUS"
  },
  {
    type = "custom-input",
    name = "decrease",
    key_sequence = "MINUS"
  },
  {
    type = "custom-input",
    name = "decrease1",
    key_sequence = "SHIFT + MINUS"
  },
  {
    type = "custom-input",
    name = "increase1",
    key_sequence = "SHIFT + EQUALS"
  },
  {
    type = "custom-input",
    name = "increase",
    key_sequence = "EQUALS"
  },
  {
    type = "custom-input",
    name = "increase2",
    key_sequence = "ALT + EQUALS"
  }
})
