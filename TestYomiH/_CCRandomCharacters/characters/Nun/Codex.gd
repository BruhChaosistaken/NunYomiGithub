extends Node

func register(codex):
	codex.set_subtitle("The Nun")
	codex.set_summary(""" Precise rushdown, prioritizing managing her [color=#ff2d2d][url=tab:Pressure]PRESSURE[/url][/color] to not obtain [color=#279FF5][url=tab:Insanity]INSANITY[/url][/color]. While having decent damage and tools to win the game.
	""")

#	codex.moveset["Awaken"].desc = "30%/0.3 more dmg dealt, and 20%/0.2 more damage received, Buffs certain moves, and Allows to [rainbow freq=0.5 sat=10 val=20]Exceed[/rainbow] the pressure limit"
	codex.moveset["Eliminate"].desc = "In Awakening hits f9 - 10."
	codex.moveset["Descend"].desc = "Hitbox spawn depends on when she hits the ground, Upgraded Version hits OTG and is faster."
	codex.moveset["Affix"].desc = "Swap Places with the most recent Skull, Also Swapping its momentum with yours and vice versa. This builds a small amount of [color=#ff2d2d][url=tab:Pressure]PRESSURE[/url][/color], but if DI isnt dead center when using the Projectile will be propelled in the DI's direction. Building even more pressure."
	codex.moveset["Intimidate"].desc = "Walk, Nothing special. Gains a small amount of pressure while doing it."
	codex.moveset["SpinningSkulls"].desc = "Spawn 2 non-hostile projectiles that move in a straight line, upon coming in contact gain a momentum boost based on current DI."
	codex.moveset["SUFFER"].desc = "Spawn a bouncing Skull, Upon attacking it -- it spawns a tinier skull which direction depends on DI and where it was hit. Be aware that this moves builds [color=#ff2d2d][url=tab:Pressure]PRESSURE[/url][/color] "
	codex.moveset["Sprint"].desc = "Basically a super dash but custom fit, when using gain a few extra moves. On initiative it does not collide with opponent."
	codex.moveset["Upper-Cut"].desc = "On iniative this move is 3 frames faster."
	
	codex.moveset["OVERLOAD"].desc = "Upon successful use (Not getting hit in startup), Nun goes into a TEMPORARY state where her pressure does not go down and is not affected by [color=#279FF5][url=tab:Insanity]INSANITY[/url][/color], BUT -- once the timer shown above her head is over she is immediately affected by [color=#279FF5][url=tab:Insanity]INSANITY[/url][/color]. "
	codex.moveset["STALK DECIMATE"].desc = "Command grab which amount of stabs correlate to amount of pressure. The rest is self explanatory, play the character."
	codex.moveset["Impalation"].desc = "This modifies Nuns hitbox and gives a short amount of proj invulnerability. Starting from frame 3, in combo it skd (soft knockdown) the enemy, Meaning it ends combo."
	codex.moveset["Taunt"].desc = "Removes a considerable amount of pressure on use."

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
[center] [color=#ff2d2d]- PRESSURE - [/color] [/center] 
Pressure is what Nun prioritizes each match, and as she earns more she gains access to more tools, But having to manage this resource is important because if used carelessly Nun enters the [color=#279FF5][url=tab:Insanity]INSANITY[/url][/color] state.

	Some changes are applied automatically after a certain threshold, But some tools are kept under upgrading a move when the option is available:

[center]ANY PERCENT 0%/ 0.0 AND ABOVE:[/center]

	[img]res://ui/ActionSelector/StateIcons/grab.png[/img] - Throwing behind you deals extra damage in porportion to the amount of pressure you have, in exchange back grab deals less damage.

[center]At 50%/ 0.5:[/center]

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon16.png[/img] - It is now +10 on block.

[center]Above 50%/0.5:[/center]

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/normal/Icons28.png[/img] - Will drain pressure down to 50%, spending pressure for each extra stab.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon12.png[/img] - The higher your pressure, the more chip damage it does.

	[img]res://_CCRandomCharacters/characters/Nun/Sprites/Icons/Uper/Icoon13.png[/img] - Spawns 2 skulls behind you.

[center]DEPLETING PRESSURE[/center]
Options to deplete Pressure:

	Using Normal Attacks.
	Using Sprint.
	Using Hustle.
	Spending Pressure to upgrade attacks.

""")

	codex.add_custom_text_tab("Insanity", """

[center] [color=#279FF5] INSANITY [/color] [/center]
Insanity is a state in where you get punished for spamming tools that build pressure, needing you to keep a balance between the resources to not be at a disadvantage.

Once Pressure has reached its max the "Insanity bar" below Nuns pressure gauge fiils up (Unless in [url=OVERLOAD]OVERLOAD[/url]), Letting this bar fill up to max stuns Nun until INSANITY is back to 0. If the stun is avoided or the stun is cancelled you enter the [color=#27F598]EXHAUSTED[/color] state.

[center] [color=#27F598] EXHAUSTED [/color] [/center]
After Nun has taken the INSANITY stun, Nun is set to an [color=#27F598] EXHAUSTED [/color] state being unable to gain pressure from any means -- Once the bar has settled down Nun will be able to accumulate Pressure as normal.



""")

func setup_achievements(list):
	list.set_title("beat_5_shika_ach", "Severed Connections")
	list.set_desc("beat_5_shika_ach", "Beat Shika 5 times.")
	list.assign_counter("beat_5_shika_ach", "Shikas_Deafeated", 5)

	list.set_title("beat_50_char_ach", "Repentance")
	list.set_desc("beat_50_char_ach", "Defeat 50 DIFFERENT modded / base characters.")
	list.assign_counter("beat_50_char_ach", "chars_defeated", 50)

	list.set_title("decimate_finisher_ach", "Bloody Hands.")
	list.set_desc("decimate_finisher_ach", "Finish a Player with Decimate")

	list.set_title("Greaper_ach", "Grim Reaper")
	list.set_desc("Greaper_ach", "Win 150 times")
	list.assign_counter("Greaper_ach", "Wins", 150)

	list.set_title("insanity_ach", "Brain Damage.")
	list.set_desc("insanity_ach", "With Nun, get stunned from Insanity 20 times in total.")
	list.assign_counter("insanity_ach", "Insanity_Total", 20)

	list.set_title("insanitydeath_ach", "Full Counter.")
	list.set_desc("insanitydeath_ach", "With Nun, Win a match while in Insanity stun.")

	list.set_title("pushblock_ach", "Scaredy Cat")
	list.set_desc("pushblock_ach", "With Nun, Have an Opponent use Pushblock against you 3 times in one match.")

	list.set_title("secret_ach", "You Still Remember.")
	list.set_desc("secret_ach", "fesjfipsejfngnsijrndikgjljsfsfjsklfs")
	list.mark_secret("secret_ach")
