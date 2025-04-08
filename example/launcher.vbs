Set objShell = CreateObject("WScript.Shell")

rubyPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName) & "/Ruby34-x64/bin/ruby.exe"
scriptPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName) & "/main.rb"

command = """" & rubyPath & """ """ & scriptPath & """"
objShell.Run command, 1, False
