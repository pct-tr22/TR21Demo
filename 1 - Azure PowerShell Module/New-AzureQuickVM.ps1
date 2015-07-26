#Search for 'Replace' and replce with relevant information.

$vmName = 'Replace'
$VMImageName = 'Replace'
$VMSize = 'Replace'
$AzureCloudService = 'Replace'
$adminUser = 'Replace'
$adminPassword = 'Replace'

#Create New Service
New-AzureQuickVM -Windows -ServiceName $AzureCloudService -Name $vmName -ImageName $VMImageName -InstanceSize $VMSize -AdminUsername $adminUser -Password $adminPassword
