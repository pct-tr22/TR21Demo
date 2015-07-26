#Search for 'Replace' and replce with relevant information.

$VM = Get-AzureVM -Name 'Replace' -ServiceName 'Replace'
Set-AzureVMDscExtension -VM $VM -ConfigurationArchive 'Replace' -ConfigurationName APP | Update-AzureVM

Get-AzureVMDscExtensionStatus -VM $VM