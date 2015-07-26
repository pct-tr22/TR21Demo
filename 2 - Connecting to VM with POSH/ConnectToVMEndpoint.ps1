#Search for 'Replace' and replce with relevant information.

$AzureVM = 'Replace'
$CloudService = 'Replace'
$mycreds = Get-Credential
   
#Get WinRM Certificate Thubprint and certificate object identified by thubprint.
$winRMCert = (Get-AzureVM -ServiceName $CloudService -Name $AzureVM | select -ExpandProperty vm).DefaultWinRMCertificateThumbprint   
$AzureX509cert = Get-AzureCertificate -ServiceName $CloudService -Thumbprint $winRMCert -ThumbprintAlgorithm sha1

if ((Test-Path Cert:\LocalMachine\Root\$winRMCert) -eq $false) {
    Write-Progress "VM certificate is not in local machine certificate store - adding it"
    $certByteArray = [System.Convert]::fromBase64String($AzureX509cert.Data)
    $CertToImport = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 -ArgumentList (,$certByteArray)
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store "Root", "LocalMachine"
    $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
    $store.Add($CertToImport)
    $store.Close()
}
		
$RMUri = Get-AzureWinRMUri -ServiceName $CloudService -Name $AzureVM

Invoke-Command -ConnectionUri $RMUri -Credential $mycreds {

    $folder = "c:\temp"
    $log = "c:\temp\AzureLog.txt"
    $date = get-date

    If (!(Test-Path $log)) {
    
    New-Item -Path $folder -ItemType Directory
    New-Item -Path $log -ItemType File
    Add-Content -Value "NEW LOG: Azure PowerShell Endpoint - $date" -Path $log

    } else {

        Add-Content -Value "EXSISITNG LOG: Azure PowerShell Endpoint - $date" -Path $log

    }
}