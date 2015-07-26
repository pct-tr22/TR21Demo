workflow StopAllVM
{
	$cred = Get-AutomationPSCredential -Name 'AzureAccount'
    $null1 = Add-AzureAccount -Credential $Cred
    
    InlineScript {
        $null2 = Select-AzureSubscription -SubscriptionName "Windows Azure MSDN - Visual Studio Ultimate"
        Get-AzureVM | Stop-AzureVM -StayProvisioned        
     }  
}