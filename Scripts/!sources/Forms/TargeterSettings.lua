local m_template = nil



function CreateTargeterSettingsForm()
	local form=createWidget(nil, "targeterSettingsForm", "Form", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 980, 550, 200, 100)
	hide(form)
	priority(form, 5000)

	local panel=createWidget(form, "Panel", "Panel")
	
	local group1 = createWidget(form, "group1", "Panel")
	align(group1, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group1, 315, 211)
	move(group1, 15, 47)
	
	local group2 = createWidget(form, "group2", "Panel")
	align(group2, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group2, 315, 151)
	move(group2, 15, 257)
	
	local group3 = createWidget(form, "group3", "Panel")
	align(group3, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group3, 315, 121)
	move(group3, 335, 47)
	
	local group4 = createWidget(form, "group4", "Panel")
	align(group4, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group4, 315, 323)
	move(group4, 335, 167)
	
	local group5 = createWidget(form, "group5", "Panel")
	align(group5, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group5, 315, 443)
	move(group5, 655, 47)

	setLocaleText(createWidget(form, "targeterSettingsFormHeader", "TextView",  WIDGET_ALIGN_CENTER, nil, 200, 20, nil, 16))
	setText(createWidget(form, "closeSomeSettingsButton", "Button", WIDGET_ALIGN_HIGH, WIDGET_ALIGN_LOW, 20, 20, 20, 20), "x")
		
	createWidget(form, "showServerNameButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 50)
	createWidget(form, "classColorModeButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 80)
	createWidget(form, "showClassIconButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 110)
	createWidget(form, "showProcentButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 140)
	createWidget(form, "showShieldButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 170)
	createWidget(form, "woundsShowButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 200)
	createWidget(form, "showManaButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 230)
	
	createWidget(form, "gorisontalModeButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 260)
	createWidget(form, "highlightSelectedButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 290)
	createWidget(form, "hideUnselectableButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 320)
	createWidget(form, "separateBuffDebuff", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 350)
	createWidget(form, "twoColumnMode", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 380)
	
	
	
	setLocaleText(createWidget(form, "raidWidthText", "TextView", nil, nil, 200, 25, 20, 410))
	setLocaleText(createWidget(form, "raidHeightText", "TextView", nil, nil, 200, 25, 20, 440))
	setLocaleText(createWidget(form, "buffSizeText", "TextView", nil, nil, 200, 25, 20, 470))
	createWidget(form, "targeterWidthEdit", "EditLine", nil, nil, 80, 25, 240, 410, nil, nil)
	createWidget(form, "targeterHeightEdit", "EditLine", nil, nil, 80, 25, 240, 440, nil, nil)
	createWidget(form, "buffSizeEdit", "EditLine", nil, nil, 80, 25, 240, 470, nil, nil)
	
	setLocaleText(createWidget(form, "raidBuffsButton", "TextView", nil, nil, 200, 25, 410, 50))
	createWidget(form, "checkEnemyCleanable", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 340, 80)
	createWidget(form, "checkControlsButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 340, 110)
	createWidget(form, "checkMovementsButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 340, 140)
	setLocaleText(createWidget(form, "raidBuffsList", "TextView", nil, nil, 200, 25, 410, 170))
	createWidget(form, "container1", "ScrollableContainer", nil, nil, 310, 260, 340, 190)
	setLocaleText(createWidget(form, "addTargeterBuffButton", "Button", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 130, 25, 510, 460))
	createWidget(form, "EditLine1", "EditLine", nil, nil, 160, 25, 340, 460)
	
	setLocaleText(createWidget(form, "myTargetsButton", "TextView", nil, nil, 200, 25, 715, 50))
	createWidget(form, "container2", "ScrollableContainer", nil, nil, 310, 380, 665, 70)
	setLocaleText(createWidget(form, "addTargetButton", "Button", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 130, 25, 835, 460))
	createWidget(form, "EditLine2", "EditLine", nil, nil, 160, 25, 665, 460)
	
	setLocaleText(createWidget(form, "saveButton", "Button", WIDGET_ALIGN_CENTER, WIDGET_ALIGN_HIGH, 200, 30, nil, 20))
	
	DnD:Init(form, panel, true)
		
	return form
end

function SaveTargeterFormSettings(aForm)
	local mySettings = {}
	local profile = GetCurrentProfile()
	mySettings = profile.targeterFormSettings
	
	mySettings.classColorModeButton = getCheckBoxState(getChild(aForm, "classColorModeButton"))
	mySettings.showServerNameButton = getCheckBoxState(getChild(aForm, "showServerNameButton"))
	mySettings.showManaButton = getCheckBoxState(getChild(aForm, "showManaButton"))
	mySettings.showEnergyButton = getCheckBoxState(getChild(aForm, "showEnergyButton"))
	mySettings.showShieldButton = getCheckBoxState(getChild(aForm, "showShieldButton"))
	mySettings.showClassIconButton = getCheckBoxState(getChild(aForm, "showClassIconButton"))
	mySettings.showProcentButton = getCheckBoxState(getChild(aForm, "showProcentButton"))
	mySettings.gorisontalModeButton = getCheckBoxState(getChild(aForm, "gorisontalModeButton"))
	mySettings.woundsShowButton = getCheckBoxState(getChild(aForm, "woundsShowButton"))
	mySettings.highlightSelectedButton = getCheckBoxState(getChild(aForm, "highlightSelectedButton"))
	mySettings.hideUnselectableButton = getCheckBoxState(getChild(aForm, "hideUnselectableButton"))
	mySettings.separateBuffDebuff = getCheckBoxState(getChild(aForm, "separateBuffDebuff"))
	mySettings.twoColumnMode = getCheckBoxState(getChild(aForm, "twoColumnMode"))
	
	mySettings.raidWidthText = getTextString(getChild(aForm, "targeterWidthEdit"))
	mySettings.raidHeightText = getTextString(getChild(aForm, "targeterHeightEdit"))
	mySettings.buffSize = getTextString(getChild(aForm, "buffSizeEdit"))

	mySettings.raidBuffs.checkEnemyCleanable = getCheckBoxState(getChild(aForm, "checkEnemyCleanable"))
	mySettings.raidBuffs.checkControlsButton = getCheckBoxState(getChild(aForm, "checkControlsButton"))
	mySettings.raidBuffs.checkMovementsButton = getCheckBoxState(getChild(aForm, "checkMovementsButton"))
	
	UpdateTableValuesFromContainer(mySettings.raidBuffs.customBuffs, aForm, getChild(aForm, "container1"))
	UpdateTableValuesFromContainer(mySettings.myTargets, aForm, getChild(aForm, "container2"))

	return mySettings
end

function LoadTargeterFormSettings(aForm)
	local profile = GetCurrentProfile()
	local mySettings = profile.targeterFormSettings
	if mySettings.separateBuffDebuff == nil then mySettings.separateBuffDebuff = false end
	if mySettings.twoColumnMode == nil then mySettings.twoColumnMode = false end
	
	setLocaleText(getChild(aForm, "classColorModeButton"), mySettings.classColorModeButton, true)
	setLocaleText(getChild(aForm, "showServerNameButton"), mySettings.showServerNameButton, true)
	setLocaleText(getChild(aForm, "showManaButton"), mySettings.showManaButton, true)
	setLocaleText(getChild(aForm, "showEnergyButton"), mySettings.showEnergyButton, true)
	setLocaleText(getChild(aForm, "showShieldButton"), mySettings.showShieldButton, true)
	setLocaleText(getChild(aForm, "showClassIconButton"), mySettings.showClassIconButton, true)
	setLocaleText(getChild(aForm, "showProcentButton"), mySettings.showProcentButton, true)
	setLocaleText(getChild(aForm, "gorisontalModeButton"), mySettings.gorisontalModeButton, true)
	setLocaleText(getChild(aForm, "woundsShowButton"), mySettings.woundsShowButton, true)
	setLocaleText(getChild(aForm, "highlightSelectedButton"), mySettings.highlightSelectedButton, true)
	setLocaleText(getChild(aForm, "hideUnselectableButton"), mySettings.hideUnselectableButton, true)
	setLocaleText(getChild(aForm, "separateBuffDebuff"), mySettings.separateBuffDebuff, true)
	setLocaleText(getChild(aForm, "twoColumnMode"), mySettings.twoColumnMode, true)
	
	setText(getChild(aForm, "targeterWidthEdit"), mySettings.raidWidthText)
	setText(getChild(aForm, "targeterHeightEdit"), mySettings.raidHeightText)
	setText(getChild(aForm, "buffSizeEdit"), mySettings.buffSize)
	
	setLocaleText(getChild(aForm, "checkEnemyCleanable"), mySettings.raidBuffs.checkEnemyCleanable, true)
	setLocaleText(getChild(aForm, "checkControlsButton"), mySettings.raidBuffs.checkControlsButton, true)
	setLocaleText(getChild(aForm, "checkMovementsButton"), mySettings.raidBuffs.checkMovementsButton, true)

	ShowValuesFromTable(profile.targeterFormSettings.raidBuffs.customBuffs, aForm, getChild(aForm, "container1"))
	ShowValuesFromTable(profile.targeterFormSettings.myTargets, aForm, getChild(aForm, "container2"))
end