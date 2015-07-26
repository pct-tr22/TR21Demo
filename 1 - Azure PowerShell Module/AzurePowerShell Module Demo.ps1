#Search for 'Replace' and replce with relevant information.

#----------------------------------------------------
#Module Version
#----------------------------------------------------

Get-Module -ListAvailable | where {$_.Name -eq 'Azure'}

#----------------------------------------------------
#Add Accounts Demo
#----------------------------------------------------

Get-AzureAccount
Add-AzureAccount
Get-AzureAccount
Remove-AzureAccount -Name 'Replace' -Force

#----------------------------------------------------
#Add Azure Account with PSCredential Object
#----------------------------------------------------

$cred = Get-Credential
Add-AzureAccount -Credential $cred

Get-AzureVM

#----------------------------------------------------
#Configure up Storage Account
#----------------------------------------------------

Get-AzureSubscription

$sub = Get-AzureSubscription
$str = Get-AzureStorageAccount -StorageAccountName 'Replace'
Set-AzureSubscription -SubscriptionName $sub.SubscriptionName -CurrentStorageAccountName $str.Label

Get-AzureSubscription

#----------------------------------------------------
#Difference Between Two Modules.
#----------------------------------------------------

Switch-AzureMode AzureServiceManagement
(Get-Command -Module Azure).count

Switch-AzureMode AzureResourceManager
(Get-Command -Module AzureResourceManager).count

#----------------------------------------------------
#Demo differences in Get-AzureVM from both modules.
#----------------------------------------------------

Switch-AzureMode AzureServiceManagement
Get-Help Get-AzureVM

Switch-AzureMode AzureResourceManager
Get-Help Get-AzureVM