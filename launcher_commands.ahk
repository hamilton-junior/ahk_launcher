openUrl(searchQuery, title) {
    gui_search(searchQuery, title)

}
open(param) {
    gui_destroy()
    Run param
}

SpecialCommand(command) {
    gui_destroy()
    ; Perform actions based on the provided command
    if (command = "rel") {
        Reload
    } else if (command = "name") {
        MsgBox("your name lol", "bamboozled xd","t5")
    }
}

Switch var {
    case "g" . A_Space:
        openUrl("http://www.google.com/search?q=REPLACEME", "Google")
    case "xi" . A_Space:
        openUrl("firefox.exe --private-window https://www.google.com/search?safe=off&q=REPLACEME", "Firefox Incognito")
    case "xg" . A_Space:
        openUrl("firefox.exe -P guest https://www.google.com/search?safe=off&q=REPLACEME", "firefox Guest")
    case "y" . A_Space:
        openUrl("https://www.youtube.com/results?search_query=REPLACEME", "YouTube")
    case "m" . A_Space:
        ; Open more than one URL
        openUrl("https://www.google.com/search?&q=REPLACEME", "Many")
        openUrl("https://www.bing.com/search?q=REPLACEME", "Many")
        openUrl("https://duckduckgo.com/?q=REPLACEME", "Many")
}

; Launch applications
Switch var {
    case "uni":
        open("appwiz.cpl")
    case "env":
        open("D:\apps\env_var.lnk")
    case "rege":
        ; Open Registry Editor
        open("C:\Windows\regedit.exe")
    case "gpe":
        ; Open Group Policy Editor
        open("gpedit.msc")
    case "task":
        ; Open Task Scheduler
        open("taskschd.msc")
    case "msco":
        ; Open System Configuration (msconfig)
        open("msconfig")
    case "upd":
        ; Open Windows Update
        open("ms-settings:windowsupdate")
    case "def":
        open("windowsdefender:")
    case "god":
        ; Open God Mode
        open("GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}")
    case "wapp":
        ; Open All Apps
        open("shell:appsfolder")
    case "winv":
        open("winver")
    case "part":
        ; Open Disk Management - Partitions Tool
        open("C:\Windows\system32\diskmgmt.msc")
}

; Folders
Switch var {
    case "hom":
        open("C:\Users\" . A_Username . "")
    case "local":
        open("C:\Users\" . A_Username . "\AppData\Local")
    case "roam":
        open("C:\Users\" . A_Username . "\AppData\Roaming")
    case "star":
        open("C:\Users\" . A_Username . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
    case "t1":
        open("C:\Windows\Temp")
    case "t2":
        open("C:\Users\" . A_Username . "\AppData\Local\Temp")
    case "rec":
        ; Recycle Bin
        open("::{645FF040-5081-101B-9F08-00AA002F954E}")
}

; Special Commands
Switch var {
    case "rel", "name":
        SpecialCommand(var)
}
