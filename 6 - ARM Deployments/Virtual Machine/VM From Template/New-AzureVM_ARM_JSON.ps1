#Search for 'Replace' and replce with relevant information.

$ARMDeployment = @{
    Name = 'Replace'
    Location = 'Replace'
    newStorageAccountName = ('Replace').ToLower()
    adminUsername = 'Replace'
    adminPassword = convertto-securestring 'Replace' -asplaintext -force
    dnsNameForPublicIP = 'Replace'
    windowsOSVersion = 'Replace'
    TemplateFile = 'Replace'
}

Switch-AzureMode AzureResourceManager

New-AzureResourceGroup @ARMDeployment