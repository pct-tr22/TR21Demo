#Search for 'Replace' and replce with relevant information.

$VM = @{

    Name = 'Replace'
    Windows = True
    ServiceName = 'Replace'
    ImageName = 'Replace'
    InstanceSize = 'Replace'
    AdminUsername = 'Replace'
    Password = 'Replace'
}

New-AzureQuickVM @VM