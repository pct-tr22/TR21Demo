#Search for 'Replace' and replce with relevant information.

$VMName = 'Replace'
$VMSize = 'Replace'
$VMImage = 'Replace'
$LocalUser = 'Replace'
$LocalPassword = 'Replace'
$Domain = 'Replace'
$DomainUser = 'Replace'
$DomainPassword = 'Replace'
$AzureSubnet = 'Replace'
$DSCConfigFile = 'Replace'
$DSCConfig = 'Replace'
$AzureCloudService = 'Replace'
$AzureVNet = 'Replace'

$newVM = New-AzureVMConfig -Name $VMName -InstanceSize $VMSize -ImageName $VMImage |Add-AzureProvisioningConfig -WindowsDomain -AdminUsername $LocalUser -Password $LocalPassword -Domain $Domain -DomainUserName $DomainUser -DomainPassword $DomainPassword -JoinDomain $Domain |Set-AzureSubnet -SubnetNames $AzureSubnet
$newVM = Set-AzureVMDscExtension -VM $newVM -ConfigurationArchive $DSCConfigFile -ConfigurationName $DSCConfig
New-AzureVM -VMs $newVm -ServiceName $AzureCloudService -VNetName $AzureVNet

