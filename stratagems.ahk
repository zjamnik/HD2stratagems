#singleInstance force
SendMode "Event"
SetKeyDelay 100, 50

if ( not WinExist("ahk_exe helldivers2.exe")) {
    runResult := MsgBox("Do you want to start the game?", "Run Helldivers 2?", "292 T10")

    if (runResult = "yes") {
        Run("steam://rungameid/553850")
    }
}

sendStratagem(keyname) {
    BlockInput("On")
    Send("{LControl down}" . getStratagem(getValue("HOTKEYS", keyname)) . "{LControl up}")
    ; Send getStratagem(getValue("HOTKEYS", keyname))
    BlockInput("Off")
}



; Loadout recorder
global recording := false
; HotIfWinactive("ahk_exe helldivers2.exe")
; Hotkey("~Space", () => setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "x"), "Off")
;     Hotkey("~w:: setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "w"), "Off")
;     Hotkey("~s:: setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "s"), "Off")
;     Hotkey("~a:: setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "a"), "Off")
;     Hotkey("~d", (*) => setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "d"), "Off")

;     [:: {
;         if (recording) {
;             Hotkey("~Space", , "Off")
;             Hotkey("~w", , "Off")
;             Hotkey("~s", , "Off")
;             Hotkey("~a", , "Off")
;             Hotkey("~d", , "Off")
;         } else {
;             Hotkey("~Space", , "On")
;             Hotkey("~w", , "On")
;             Hotkey("~s", , "On")
;             Hotkey("~a", , "On")
;             Hotkey("~d", , "On")
;             setValue("LOADOUTS", "GuardDog", getValue("LOADOUTS", "GuardDog") . "")
;         }
;         global recording := not recording
;     }
]:: {
    loop parse getValue("LOADOUTS", getValue("HOTKEYS", "Loadout")) {
        Send(A_LoopField = "x" ? "{Space}" : A_LoopField)
    }
}

; Config handling
{
    ; Enable numlock, revert previous state on exit
    orgNumlockState := GetKeyState("NumLock", "T")
    SetNumLockState("AlwaysOn")

    ; Config path
    configPath := A_ScriptDir . "\config.ini"

    ; Config file init
    if ( not FileExist(configPath)) {
        FileAppend("", configPath)

        ; load defaults
        initValue("HOTKEYS", "NumpadDiv")
        initValue("HOTKEYS", "NumpadMult")
        initValue("HOTKEYS", "NumpadSub")
        initValue("HOTKEYS", "Numpad7")
        initValue("HOTKEYS", "Numpad8")
        initValue("HOTKEYS", "Numpad9")
        initValue("HOTKEYS", "NumpadAdd")
        initValue("HOTKEYS", "Numpad4")
        initValue("HOTKEYS", "Numpad5")
        initValue("HOTKEYS", "Numpad6")
        initValue("HOTKEYS", "Numpad1")
        initValue("HOTKEYS", "Numpad2")
        initValue("HOTKEYS", "Numpad3")
        initValue("HOTKEYS", "NumpadEnter")
        initValue("HOTKEYS", "Numpad0")
        initValue("HOTKEYS", "NumpadDot")

        FileAppend("`n", configPath)
        
        initValue("WINDOW", "X", 0)
        initValue("WINDOW", "Y", 0)
        initValue("WINDOW", "AlwaysOnTop", "+")
    }

    ; Config functions
    getValue(section, key, default := "") {
        return IniRead(configPath, section, key, default)
    }

    setValue(section, key, value) {
        IniWrite(value, configPath, section, key)
        return value
    }

    initValue(section, key, default := "Blank") {
        return setValue(section, key, getValue(section, key, default))
    }

    getStratagem(name) {
        return IniRead(A_ScriptDir . "\stratagems.const", "STRATAGEMS", name, "")
    }
}

; Load hotkeys
loop parse, IniRead(configPath, "HOTKEYS"), "`n" {
    hotkeyPair := StrSplit(A_LoopField, "=")
    HotIfWinactive("ahk_exe helldivers2.exe")
    Hotkey(hotkeyPair[1], sendStratagem)
}

; GUI
{
    MyGui := Gui("-Resize " . getValue("WINDOW", "AlwaysOnTop") . "AlwaysOnTop", "HD2 Stratagems")
    MyGui.BackColor := "292929"
    \:: MyGui.Restore()

    MyGui.OnEvent("Close", MyGui_Close)
    OnExit(MyGui_Close)

    MyGui_Close(*) {
        SetNumLockState(orgNumlockState = 0 ? "Off" : "On")
        MyGui.GetPos(&guiX, &guiY)
        setValue("WINDOW", "X", guiX)
        setValue("WINDOW", "Y", guiY)
        ExitApp(0)
    }

    MyGui.Add("Picture", "VAlwaysOnTop X0 Y0 W64 H64", A_ScriptDir . "\Icons\" . "AlwaysOnTop" . ".png").OnEvent("Click", (*) => MyGui.Opt(setValue("WINDOW", "AlwaysOnTop", getValue("WINDOW", "AlwaysOnTop") = "-" ? "+" : "-") . "AlwaysOnTop")) ; AlwaysOnTop

    MyGui.Add("Picture", "VNumpadDiv X64 Y0 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadDiv") . ".png").OnEvent("Click", buttonClick) ; NumpadDiv
    MyGui.Add("Picture", "VNumpadMult X128 Y0 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadMult") . ".png").OnEvent("Click", buttonClick) ; NumpadMult
    MyGui.Add("Picture", "VNumpadSub X192 Y0 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadSub") . ".png").OnEvent("Click", buttonClick) ; NumpadSub
    MyGui.Add("Picture", "VNumpad7 X0 Y64 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad7") . ".png").OnEvent("Click", buttonClick) ; Numpad7
    MyGui.Add("Picture", "VNumpad8 X64 Y64 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad8") . ".png").OnEvent("Click", buttonClick) ; Numpad8
    MyGui.Add("Picture", "VNumpad9 X128 Y64 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad9") . ".png").OnEvent("Click", buttonClick) ; Numpad9

    MyGui.Add("Picture", "VNumpadAdd X192 Y96 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadAdd") . ".png").OnEvent("Click", buttonClick) ; NumpadAdd
    MyGui.Add("Picture", "VNumpad4 X0 Y128 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad4") . ".png").OnEvent("Click", buttonClick) ; Numpad4
    MyGui.Add("Picture", "VNumpad5 X64 Y128 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad5") . ".png").OnEvent("Click", buttonClick) ; Numpad5
    MyGui.Add("Picture", "VNumpad6 X128 Y128 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad6") . ".png").OnEvent("Click", buttonClick) ; Numpad6
    MyGui.Add("Picture", "VNumpad1 X0 Y192 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad1") . ".png").OnEvent("Click", buttonClick) ; Numpad1
    MyGui.Add("Picture", "VNumpad2 X64 Y192 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad2") . ".png").OnEvent("Click", buttonClick) ; Numpad2
    MyGui.Add("Picture", "VNumpad3 X128 Y192 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad3") . ".png").OnEvent("Click", buttonClick) ; Numpad3

    MyGui.Add("Picture", "VNumpadEnter X192 Y224 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadEnter") . ".png").OnEvent("Click", buttonClick) ; NumpadEnter

    MyGui.Add("Picture", "VNumpad0 X32 Y256 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "Numpad0") . ".png").OnEvent("Click", buttonClick) ; Numpad0
    MyGui.Add("Picture", "VNumpadDot X128 Y256 W64 H64", A_ScriptDir . "\Icons\" . getValue("HOTKEYS", "NumpadDot") . ".png").OnEvent("Click", buttonClick) ; NumpadDot
    buttonClick(GuiCtrlObj, Info) {
        stratagemPath := FileSelect(3, A_ScriptDir . "\Icons", "Select stratagem", "Stratagem (*.png)")
        if ( not stratagemPath = "") {
            stratagem := StrSplit(stratagemPath, "\")
            stratagem := StrSplit(stratagem[stratagem.Length], ".")[1]
            setValue("HOTKEYS", GuiCtrlObj.Name, stratagem)
            GuiCtrlObj.Value := stratagemPath
            GuiCtrlObj.Redraw()
        }
    }
    MyGui.Show("X" . getValue("WINDOW", "X") . " Y" . getValue("WINDOW", "Y") . " W256 H320")
}