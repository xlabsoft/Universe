local m_currentProfile = nil
local m_currentProfileInd = nil

local function GetMyUserInd()
	local userID = avatar.GetServerId() or ""
	local buildID = avatar.GetActiveBuild() or ""
	
	return userID.."_"..buildID
end

local function LoadCurrentProfileInd()
	local lastUsedProfiles = userMods.GetGlobalConfigSection("TR_LastProfileArr")
	local currentInd = lastUsedProfiles[GetMyUserInd()]
	if currentInd == nil or currentInd == 0 then
		currentInd = 1
	end
	return currentInd
end

local function SetCurrentProfileInd(anInd)
	local lastUsedProfiles = userMods.GetGlobalConfigSection("TR_LastProfileArr")
	lastUsedProfiles[GetMyUserInd()] = anInd
	userMods.SetGlobalConfigSection("TR_LastProfileArr", lastUsedProfiles)
end


function InitializeDefaultSetting()
	local allProfiles = userMods.GetGlobalConfigSection("TR_ProfilesArr")
	if allProfiles then
		return
	end
	
	allProfiles = {}
	local defaultProfile = {}
	
	local mainFormSettings = {}
	mainFormSettings.useRaidSubSystem = true
	mainFormSettings.useTargeterSubSystem = true
	mainFormSettings.useBuffMngSubSystem = true
	mainFormSettings.useBindSubSystem = false
	
	
	local raidFormSettings = {}
	raidFormSettings.classColorModeButton = false
	raidFormSettings.showManaButton = false
	raidFormSettings.showShieldButton = true
	raidFormSettings.showStandartRaidButton = false
	raidFormSettings.showClassIconButton = true
	raidFormSettings.showDistanceButton = true
	raidFormSettings.showProcentButton = false
	raidFormSettings.showArrowButton = true
	raidFormSettings.gorisontalModeButton = false
	raidFormSettings.woundsShowButton = false
	raidFormSettings.showServerNameButton = true
	raidFormSettings.highlightSelectedButton = true
	raidFormSettings.raidWidthText = "160"
	raidFormSettings.raidHeightText = "50"
	raidFormSettings.distanceText = "0"
	raidFormSettings.buffSize = "20"
	raidFormSettings.raidBuffs = {}
	raidFormSettings.raidBuffs.autoDebuffModeButton = true
	raidFormSettings.raidBuffs.showImportantButton = true
	raidFormSettings.raidBuffs.checkControlsButton = false
	raidFormSettings.raidBuffs.checkMovementsButton = false
	raidFormSettings.raidBuffs.colorDebuffButton = false
	raidFormSettings.raidBuffs.customBuffs = {}
	
	local targeterFormSettings = {}
	targeterFormSettings.classColorModeButton = false
	targeterFormSettings.showManaButton = false
	targeterFormSettings.showShieldButton = true
	targeterFormSettings.showClassIconButton = true
	targeterFormSettings.showProcentButton = false
	targeterFormSettings.gorisontalModeButton = false
	targeterFormSettings.woundsShowButton = false
	targeterFormSettings.showServerNameButton = true
	targeterFormSettings.highlightSelectedButton = true
	targeterFormSettings.hideUnselectableButton = true
	targeterFormSettings.lastTargetType = ALL_TARGETS
	targeterFormSettings.lastTargetWasActive = true
	targeterFormSettings.separateBuffDebuff = false
	targeterFormSettings.twoColumnMode = false
	targeterFormSettings.raidWidthText = "200"
	targeterFormSettings.raidHeightText = "30"
	targeterFormSettings.buffSize = "16"
	targeterFormSettings.raidBuffs = {}
	targeterFormSettings.raidBuffs.checkEnemyCleanable = false
	targeterFormSettings.raidBuffs.checkControlsButton = false
	targeterFormSettings.raidBuffs.checkMovementsButton = false
	targeterFormSettings.raidBuffs.customBuffs = {}
	targeterFormSettings.myTargets = {}
	
	local buffFormSettings = {}
	buffFormSettings.buffGroups = {}
		
	local bindFormSettings = {}
	bindFormSettings.actionLeftSwitchRaidSimple = SELECT_CLICK
	bindFormSettings.actionLeftSwitchRaidShift = DISABLE_CLICK
	bindFormSettings.actionLeftSwitchRaidAlt = DISABLE_CLICK
	bindFormSettings.actionLeftSwitchRaidCtrl = DISABLE_CLICK
	bindFormSettings.actionRightSwitchRaidSimple = MENU_CLICK
	bindFormSettings.actionRightSwitchRaidShift = DISABLE_CLICK
	bindFormSettings.actionRightSwitchRaidAlt = DISABLE_CLICK
	bindFormSettings.actionRightSwitchRaidCtrl = DISABLE_CLICK
	
	bindFormSettings.actionLeftSwitchTargetSimple = SELECT_CLICK
	bindFormSettings.actionLeftSwitchTargetShift = DISABLE_CLICK
	bindFormSettings.actionLeftSwitchTargetAlt = DISABLE_CLICK
	bindFormSettings.actionLeftSwitchTargetCtrl = DISABLE_CLICK
	bindFormSettings.actionRightSwitchTargetSimple = DISABLE_CLICK
	bindFormSettings.actionRightSwitchTargetShift = DISABLE_CLICK
	bindFormSettings.actionRightSwitchTargetAlt = DISABLE_CLICK
	bindFormSettings.actionRightSwitchTargetCtrl = DISABLE_CLICK
		
	defaultProfile.name = "default"
	defaultProfile.mainFormSettings = mainFormSettings
	defaultProfile.raidFormSettings = raidFormSettings
	defaultProfile.targeterFormSettings = targeterFormSettings
	defaultProfile.buffFormSettings = buffFormSettings
	defaultProfile.bindFormSettings = bindFormSettings
	
	defaultProfile.version = 1
	
	table.insert(allProfiles, defaultProfile)
	userMods.SetGlobalConfigSection("TR_ProfilesArr", allProfiles)	
	userMods.SetGlobalConfigSection("TR_LastProfileArr", {})
	SetCurrentProfileInd(1)
end

function LoadLastUsedSetting()
	LoadSettings(LoadCurrentProfileInd())
end

function LoadSettings(aProfileInd)
	local allProfiles = userMods.GetGlobalConfigSection("TR_ProfilesArr")
	m_currentProfile = allProfiles[aProfileInd]
	m_currentProfileInd = aProfileInd

	SetCurrentProfileInd(aProfileInd)
end

function ProfileWasDeleted(anInd)
	local lastUsedProfiles = userMods.GetGlobalConfigSection("TR_LastProfileArr")
	for i, index in ipairs(lastUsedProfiles) do
		if index == anInd then
			lastUsedProfiles[i] = 0 
		elseif index > anInd and index > 0 then
			lastUsedProfiles[i] = index - 1 
		end
	end
	if anInd == m_currentProfileInd then
		LoadLastUsedSetting()
	end
end

function SaveProfile(aProfile)
	
end

function SaveProfiles(aProfileList)
	userMods.SetGlobalConfigSection("TR_ProfilesArr", aProfileList)
end

function GetCurrentProfile()
	return m_currentProfile
end

function GetCurrentProfileInd()
	return m_currentProfileInd
end

function GetAllProfiles()
	return userMods.GetGlobalConfigSection("TR_ProfilesArr")
end