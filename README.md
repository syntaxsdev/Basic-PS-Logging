# Basic-PS-Logging
Extremely simple logging feature for my PowerShell projects.
Allows for conditional logging for easy inline log solutions.


## Example
    $ls = [LogSystem]::new("P:\logdata\myLog.txt")
    $ls.addLog("Error Code: 12") -> immediately sends a log with the default prefix and the message.
    $ls.addLog("Backup successful", "Backup failed", (1 -gt 1)) -> sends "Backup failed" because the condition was false.
     
     $ls = [LogSystem]::new("P:\logdata\myLog.txt", "[Logistics System LOG]: ")
     $ls.addLog("Error Code: 12") -> "[Logistics System LOG]: Error Code 12"
