#NoEnv ; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).
#SingleInstance force ; Skips the dialog box and replaces the old instance automatically

global hotkeyBox := "#Space"
global currentBoxState := "closed"

global marginX := 10
global marginY := 15  
global windowColor := "000000"
global controlColor := "000000"
global fontSize := 26
global fontName := "Verdana"
global fontColor := "cFFFFFF"
global editBoxWidth := 250
global editBoxNoOfRows := 1
; global editBoxDefaultText := "hello world"

#WinActivateForce
destroyBox() {
    currentBoxState = "closed"
    Gui, Destroy
    WinActivate ; Focus back on the last window
}

showBox() {
    ; If box is open, destroyBox
    if currentBoxState != "closed"
    {
        destroyBox()
        return
    }

    ; Box options
    ; For performance reasons, it is better to set all options in a single line
    ; and to do so before creating the window 
    ; Caption: remove title bar and a thick window border/edge
    ; SysMenu: omit the system menu and icon 
    ; Owner: hides taskbar icon
    Gui, +AlwaysOnTop -Caption -SysMenu +Owner

    Gui, Margin, %marginX%, %marginY%
    Gui, Color, %windowColor%, %controlColor%
    Gui, Font, s%fontSize%, %fontName%

    Gui, Add, Edit, w%editBoxWidth% r%editBoxNoOfRows% %fontColor% -E0x200, %editBoxDefaultText% ; Add "Edit" GUI

    Gui, Show, Center ; Horizontally and vertically center the GUI 

    currentBoxState := "open"
}

Hotkey, %hotkeyBox%, showBox

; Esc to destroyBox
GuiEscape:
    destroyBox()
    return


