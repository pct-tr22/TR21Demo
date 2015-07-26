#Search for 'Replace' and replce with relevant information.

#Executing script against VM using extension
$VMName = 'Replace'
$Service = 'Replace'
$container = 'Replace'
$script = 'Replace'

$AzureVM = Get-AzureVM -ServiceName $Service -Name $VMName
Set-AzureVMCustomScriptExtension -VM $AzureVM -ContainerName $container -FileName $script | Update-AzureVM