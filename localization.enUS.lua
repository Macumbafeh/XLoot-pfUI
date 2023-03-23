local L = AceLibrary("AceLocale-2.0"):new("XLoot-pfUI")

L:RegisterTranslations("enUS", function()
	return {
		catSnap = "Frame Behavior",
		catLoot = "Loot Behavior",
		catFrame = "Frame options",
		catInfo = "Loot information",
		catGeneralAppearance = "General Appearance",
		catFrameAppearance = "Frame appearance",
		catLootAppearance = "Loot appearance",
		
		optLock = "Lock XLoot-pfUI frame",
		optOptions = "Options GUI",
		optBehavior = "Behavior options",
		optCursor = "Snap XLoot-pfUI frame to cursor",
		optSmartsnap = "Smart cursor snapping",
		optSnapoffset = "Snap offset",
		optCollapse = "Collapse loot buttons",
		optDragborder = "Draggable border",
		optLootexpand = "Fit frame width to loot names",
		optAltoptions = "Show menu on Alt+RightClick",
		optSwiftloot = "Don't show frame when Shift-Looting",
		optQualitytext = "Show item quality text",
		optInfotext = "Show item info text",
		optAppearance = "Appearance",
		optOskin = "Use oSkin",
		optQualityborder = "Border quality coloring",
		optQualityframe = "Background quality coloring",
		optLootqualityborder = "Loot border quality coloring",
		optBgcolor = "Frame Background Color",
		optBordercolor = "Frame Border Color",
		optTexColor = "Loot icon quality coloring",
		optLootbgcolor = "Loot Background Color",
		optLootbordercolor = "Loot Border Color",
		optScale = "Scale",
		optAdvanced = "Advanced options",
		optDebug = "Debug Messages",
		optDefaults = "Reset options to default",
		
		descLock = "Makes loot frame unmoveable",
		descOptions = "Show the options dropdown",
		descBehavior = "Change how XLoot-pfUI behaves",
		descCursor = "Snap the loot frame to the cursor whenever you loot something",
		descSmartsnap = "Snaps the loot frame only vertically to the cursor when the list shifts as you loot a item so it doesn't jump around",
		descSnapoffset = "Sets a distance from the middle of the first loot icon to snap to, horizontally",
		descCollapse = "Collapse looted (empty) buttons and place cursor over next frame if the Cursor option is enabled.",
		descDragborder = "Allows the loot window to be moved by dragging the frame's border, instead of just the buttons, which can otherwise be clicked through",
		descLootexpand = "Changes frame width to match loot names. Short names mean thin frames, long names make the frames widen",
		descAltoptions = "Allows you to Alt+RightClick on loot to bring up the XLoot-pfUI menu. Can be disabled to not mess with other mods.",
		descSwiftloot = "Attempts to find out when loot is being shift-rightclick-looted, and never shows the frame if there is space for all items. Should reduce lag when shift-looting, disable if you run into problems.",
		descQualitytext = "Show a additional line above the item name with the item's Quality",
		descInfotext = "Show a addition line below the item name with the item's Information",
		descAppearance = "Coloring, scaling, and skin of XLoot-pfUIFrame and each individual loot button",
		descOskin = "Use oSkin to skin the lootframe if oSkin is available",
		descQualityborder = "Colors lootframe border by the highest quality item",
		descQualityframe = "Colors lootframe background by the highest quality item",
		descLootqualityborder = "Colors loot borders by quality",
		descBgcolor = "Change the background color for the loot frame itself",
		descBordercolor = "Change the border color of the frame itself",
		descTexColor = "Color the border of the actual item icon/texture by quality",
		descLootbgcolor = "Change the background color for every loot item",
		descLootbordercolor = "Change the border color of every loot item",
		descScale = "Scale of the loot frame",
		descAdvanced = "Options you may not want to mess with, but can anyway.",
		descDebug = "Show debug messages",
		descDefaults = "Reinstate the database that comes with XLoot-pfUI and set all the options back to their defaults",
		
		qualityQest = "Quest item",
		
		guiTitle = "XLoot-pfUI Options",
		
		itemWeapon = "Weapon",
	}
end)