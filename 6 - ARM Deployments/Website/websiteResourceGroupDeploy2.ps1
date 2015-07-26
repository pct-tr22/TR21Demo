#Search for 'Replace' and replce with relevant information.

$ARMDeployment = @{
    Name = 'Replace'
    siteName = 'Replace'
    Location = 'Replace'
    hostingPlanName = 'Replace'
    siteLocation = 'Replace'
    sku = "Standard"
    workerSize = 0
    TemplateFile = 'Replace'
}

Switch-AzureMode AzureResourceManager

New-AzureResourceGroup @ARMDeployment