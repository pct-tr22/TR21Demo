#Search for 'Replace' and replce with relevant information.

$VM = @{
    Name = 'Replace'
    ServiceName = 'Replace'
}

$DSC = @{
    ConfigurationArchive = 'Replace'
    ConfigurationName = 'Replace'
}

$VM = Get-AzureVM @VM

Set-AzureVMDscExtension -VM $VM @DSC | Update-AzureVM

Get-AzureVMDscExtensionStatus -VM $VM