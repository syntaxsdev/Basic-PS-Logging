<#
    .DESCRIPTION
    Basic logging system. Allows you to specify the log file to use and add custom prefixes.
    Other functionality includes changing the log file, clearing the log, and writing to the log on specific conditions.

    .EXAMPLE
    $ls = [LogSystem]::new("P:\logdata\myLog.txt")
    $ls.addLog("Error Code: 12")
    $ls.addLog("Backup successful", "Backup failed", ($backup -eq 'Done')) 
#>
class LogSystem {
    $LogFile
    [string] $preFormat = "[$(Get-Date)] - " # "[07/06/2021 11:34:13] - "

    LogSystem($fileName, $pre) {
        $this.LogFile = $fileName
        Write-Host "Customized log formatting as {0}" -f $pre
        $this.preFormat = $pre
    }

    <#
        .DESCRIPTION
        Constructor 1 for the LogSystem, only takes the file name
    #>
    LogSystem($fileName)
    {
        $this.LogFile = $fileName
    }
    
    [object] ChangeLog($fileName) {
        $this.LogFile = $fileName
        return $this
    }

    [object] ClearLog() {
        $this.LogFile > ""
        return $this
    }

    [object] AddLog($trueText, $falseText, $condition) {
        if ($condition) {
            $this.addLog($trueText)
        } else {$this.addLog($falseText)}
        return $this
    }

    [object] AddLog($text) {
        Add-Content $this.LogFile ($this.preFormat + $text)
        return $this
    }
}
