extends Node

func register(codex):
	codex.set_subtitle("The Nun")
	codex.set_summary(""" Precise rushdown, prioritizing managing her pressure to not obtain INSANITY. While having decent damage and tools to win the game.
	""")

	codex.moveset["OVERLOAD"].desc = "30%/0.3 more dmg dealt, and 20%/0.2 more damage received, Buffs certain moves, and Allows to [rainbow freq=0.5 sat=10 val=20]Exceed[/rainbow] the pressure limit"
	codex.moveset["Eliminate"].desc = "In Awakening hits f9 - 10."
	codex.moveset["Descend"].desc = "Hitbox spawn depends on when she hits the ground, In awakening hits OTG."
	codex.moveset["Affix"].desc = "Swap Places with a Skull of your choosing, doing so puts Nun into a counter stance and retaliates any attack that comes in contact with her."
	codex.moveset["Intimidate"].desc = "Walk, Nothing special."


	codex.moveset["Descend"].define_hitbox("Hitbox", {
		"damage": 70,
		"stun": 13,
		"knockback": 5.0,
		"knockback_x": 1.0,
		"knockback_y": -0.5,
		"di_modifier": 0.8,
		"sdi_modifier": 1.0,
		"start": 13,
		"active": 2
		})

	codex.add_custom_text_tab("Pressure", """
[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon13.png[/img] [color=#ff2d2d] - PRESSURE[/color]
	Pressure is what Nun prioritizes each match, and as she earns more and more as the match goes on
she becomes more powerful and more of a threat, having the opponent take note and keep watch of certain moves,
even if they are slight differences in moves.

	These changes are accessed automatically upon reaching its threshold, and which harnesses the true power of certain moves.
These moves have certain thresholds to be upgraded in which is shown below:

[center]ANY PERCENT 0%/ 0.0 AND ABOVE:[/center]

	[img]res://ui/ActionSelector/StateIcons/grab.png[/img] - Throwing someone behind you deals extra damage in perportion to the amount of pressure you got.

[center]At 50%/ 0.5:[/center]

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon16.png[/img] - It is now +10 on block.

[center]Above 50%/0.5:[/center]

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/normal/Icons28.png[/img] - Will drain pressure down to 50%, spending pressure for each extra stab.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon12.png[/img] - The higher your pressure, the more chip this thing does. Might have some prediction errors.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon13.png[/img] - Spawns 2 skulls behind you.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/normal/Icons2.png[/img] - If ur di is set to the right, specifically above 0.5, you're put in stalk stance on block and hit.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon13.png[/img] - On block, spawns 2 skulls behind you.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon13.png[/img] - On block, spawns 2 skulls behind you.

[center]Above 80%/0.8:[/center]

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/normal/Icons18.png[/img] - Gains invul on max delay, specifically frame 10 - 13


""")
