# Basic-PS-Logging
Extremely simple logging feature for my PowerShell projects.
Allows for conditional logging for easy inline log solutions.


## Example using default prefix and conditional log
```powershell
$ls = [LogSystem]::new("P:\logdata\myLog.txt")
$ls.AddLog("Error Code: 12") -> immediately sends a log with the default prefix and the message.
$ls.AddLog("Backup successful", "Backup failed", (1 -gt 1)) -> sends "Backup failed" because the condition was false.
```
## Example with changing the prefix.
```powershell
$ls = [LogSystem]::new("P:\logdata\myLog.txt", "[Logistics System LOG]: ")
$ls.AddLog("Error Code: 12") -> "[Logistics System LOG]: Error Code 12"
```
### Additional Features
```powershell
$ls.ChangeLog("P:\logdata\newLog.txt") -> changes log
$ls.ClearLog() -> Empties current log file.
```
