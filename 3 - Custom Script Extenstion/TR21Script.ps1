$log = "c:\temp\AzureLog.txt"
$date = get-date

If (!(Test-Path $log)) {
    
    New-Item -Path $log -ItemType File
    Add-Content -Value "NEW LOG: Azure PowerShell Endpoint - $date" -Path $log

    } else {

        Add-Content -Value "EXSISITNG LOG: Azure VM Custom Script Extension - $date" -Path $log
}