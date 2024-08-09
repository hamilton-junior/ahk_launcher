; AUTO EXECUTE
gui_autoexecute() {
    ; Initialize color variables for GUI
    global cForeground := "c" . "000000"
    global cBlue := "c" . "00BFFF"

    ; Set options for GUI control
    global gui_control_options := "xm w220 " . cForeground . " -E0x200"
    ; -E0x200 removes border around Edit controls

    ; Initialize GUI state and other variables
    global gui_state := "closed"
    currentURL := ""
}


; LAUNCH GUI
^CapsLock:: gui_spawn()

gui_spawn() {
    ; Check if GUI is already open and close it if so
    if gui_state != "closed"
    {
        gui_destroy()
        return
    }
    gui_state := "main"

    ; Set GUI properties
    global mainGUI := Gui()
    mainGUI.MarginX := 16
    mainGUI.MarginY := 16
    mainGUI.BackColor := "0x000000"
    mainGUI.Opt("+AlwaysOnTop -SysMenu +ToolWindow -Caption")
    mainGUI.SetFont("s22 " . cBlue, "Arial")

    ; Add an Edit control to the GUI with specified options, variable, and associated label
    mainGUI.AddEdit(gui_control_options . "" . cBlue . " vvar")

    ; Show the GUI with the specified title
    mainGUI.Show("Center")
    mainGUI.vvar.OnEvent("Change", Findus())

    return
}

; GUI FUNCTIONS AND SUBROUTINES
GuiEscape() {
    gui_destroy()
    return
}
; Callback function when the text changes in the str field.
Findus() {
    mainGUI.Submit(false)
    #Include %A_ScriptDir%\launcher_commands.ahk
    return
}
#WinActivateForce
gui_destroy() {
    gui_state := "closed"

    ; Forget search title variable so the next search does not re-use it
    ; in case the next search does not set its own:
    gui_search_title := ""
    ; Destroy the GUI
    mainGUI.Destroy()

    ; Bring focus back to another window found on the desktop
    WinActivate
}


;SEARCH ENGINES

; URL Encoding Function
UrlEncode(input) {
    hex := "0123456789ABCDEF"
    safeChars := "-._~"

    output := ""
    Loop Parse input
    {
        char := A_LoopField
        if InStr(char, safeChars)
        {
            output .= char
        }
        else
        {
            ascVal := Ord(char)
            if (ascVal >= 0x41 && ascVal <= 0x5A) ; A-Z
                output .= char
            else if (ascVal >= 0x61 && ascVal <= 0x7A) ; a-z
                output .= char
            else if (ascVal >= 0x30 && ascVal <= 0x39) ; 0-9
                output .= char
            else
                output .= "%" . SubStr(hex, (ascVal >> 4) + 1, 1) . SubStr(hex, (ascVal & 0xF) + 1, 1)
        }
    }
    return output
}


gui_search_add_elements() {
    mainGUI.AddText(gui_control_options, gui_search_title)
    mainGUI.AddEdit(gui_control_options . " vgui_SearchEdit -WantReturn")
    mainGUI.AddButton("Default w1 h1 Hidden vgui_SearchEnter")
    mainGUI.control("Disabled", "var")
    mainGUI.Show("AutoSize")
}

gui_search(url, title) {
    ; Check if GUI state is not in search mode and add elements if necessary
    if gui_state != "search"
    {
        gui_state := "search"
        gui_search_title := title  ; Set the search title
        gui_search_add_elements()
    }
    global currentURL := url
}

gui_SearchEnter() {
    ; Submit the search and run the specified URL with the query
    mainGUI.Submit()
    var := vgui_SearchEdit.Value
    gui_destroy()
    encodedURL := UrlEncode(var.Value)
    finalUrl := StrReplace(encodedURL, "REPLACEME", encodedURL)
}