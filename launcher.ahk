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

boxStyleAndOptions() {
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
}

open(Command) {
    destroyBox()
    Run, %Command%, , UseErrorLevel ; Run command and check if it succeeded
    if (ErrorLevel) {
        showBox() ; If there was an error, show the box again
    }
}

handleCommand(Command) {
    Switch Command {
        case "uni":
            open("appwiz.cpl")
        case "rec":
            open("::{645FF040-5081-101B-9F08-00AA002F954E}")
        case "rege":
            open("C:\Windows\regedit.exe")
        case "file":
            open("explorer.exe")
        case "g" . A_Space:
          showSearchBox("https://www.google.com/search?q=", "Google")
        case "y" . A_Space:
          showSearchBox("https://www.youtube.com/results?search_query=", "YouTube")
    }
}

showBox() {
    ; If box is "open", destroyBox
    if currentBoxState != "closed"
    {
        destroyBox()
        return
    }

    boxStyleAndOptions()

    Gui, Add, Edit, w%editBoxWidth% r%editBoxNoOfRows% %fontColor% -E0x200 vCommand gInstantSearch, %editBoxDefaultText% ; Add "Edit" GUI

    Gui, Show, Center ; Horizontally and vertically center the GUI 

    currentBoxState := "open" ; Update the state of box to "open"
}

showSearchBox(url, title) {
    destroyBox()

    global searchBoxUrl := url
    searchBoxTitle := title

    boxStyleAndOptions()

    Gui, Add, Text, w%editBoxWidth% r%editBoxNoOfRows% %fontColor% -E0x200, %searchBoxTitle%
    Gui, Add, Edit, w%editBoxWidth% r%editBoxNoOfRows% %fontColor% -E0x200 vSearchTerm -WantReturn
    Gui, Add, Button, x-1 y-1 w0 h0 +default gSearchEnter

    GuiControl, Disable, Command ; Move focus from prev box to this box
    Gui, Show, Center

    currentBoxState = "search"
}

Hotkey, %hotkeyBox%, showBox

; Esc to destroyBox
GuiEscape:
    destroyBox()
    return

InstantSearch:
    Gui, Submit, NoHide
    handleCommand(Command)
    return

SearchEnter:
  Gui, Submit
  destroyBox()
  
  url := searchBoxUrl . SearchTerm

  run %url%

  return