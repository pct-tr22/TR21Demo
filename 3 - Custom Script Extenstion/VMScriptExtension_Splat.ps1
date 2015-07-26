#Search for 'Replace' and replce with relevant information.

$VM = @{
    ServiceName = 'Replace'
    Name = 'Replace'
}

$Script = @{
    container = 'Replace'
    FileName = 'Replace'
}

$AzureVM = Get-AzureVM @VM
Set-AzureVMCustomScriptExtension -VM $AzureVM @Script | Update-AzureVM