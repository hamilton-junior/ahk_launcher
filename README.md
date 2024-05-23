[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=JetBrainsMono&weight=700&size=85&duration=3000&pause=1500&center=true&vCenter=true&random=false&width=2500&height=90&lines=%3E+ahk_launcher;a+minimal+fork+of+plul%2FPublic-AutoHotKey-Scripts)](https://git.io/typing-svg)

## Table of Contents
- [Requirements](#requirements)
- [Usage](#usage)
- [Code Changes Overview](#code-changes-overview)
- [Contents of launcher_commands.ahk](#contents-of-launcher_commandsahk)

## Requirements
**AutoHotKey Installation:** [Download AutoHotKey v1.1](https://www.autohotkey.com/download/ahk-install.exe) or `winget install --id=AutoHotkey.AutoHotkey -v "1.1.37.02" -e`

## Usage
1. Run `run.ahk` (this script runs in the background).
2. Press **Ctrl + Space** to access the launcher.
3. Check out [launcher_commands.ahk](https://github.com/dpi0/ahk_launcher/blob/8c5ed0215d8b56ba0e061dfaa9cd19eb452501a8/launcher_commands.ahk) for adding your custom commands.

**NOTE:** By default launcher_gui.ahk, launcher_commands.ahk , and run.ahkare in the same directory, edit the `# include` in run.ahk and launcher_gui.ahk to your needs.


## Code Changes Overview
1. **Structure Enhancement:** Organized code into two files for the launcher and custom commands, improving clarity.

2. **Simplified User Commands:** Enhanced readability by refining switch cases and adding necessary functions for clarity.

3. **Tooltip Functions Removal:** Eliminated unnecessary Tooltip functions in [launcher_gui.ahk](https://github.com/dpi0/ahk_launcher/blob/8c5ed0215d8b56ba0e061dfaa9cd19eb452501a8/launcher_gui.ahk), for a cleaner codebase.

4. **GUI Refinement:**
   - Removed emojis and images for a minimalist design.
   - Ensured a coherent color scheme by removing unused colors.
   - Adjusted margin, font size, and colors for a consistent appearance.

## Contents of `launcher_commands.ahk`
The script now offers three key functionalities:

1. **Search Engine Querying:** Easily query any search engine by inputting your search term.

2. **URL Handling:** Effortlessly open URLs by providing the link.   

3. **Folder Access:** Navigate through your operating system's folders swiftly and efficiently.
