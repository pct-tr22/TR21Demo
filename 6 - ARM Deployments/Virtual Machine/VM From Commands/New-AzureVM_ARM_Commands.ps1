#Search for 'Replace' and replce with relevant information.

Switch-AzureMode AzureResourceManager
$cred = Get-Credential
$Name = 'Replace'
$Location = 'Replace'


$rgsplat = @{
    Name = $Name
    Location = $Location
}

New-AzureResourceGroup @rgsplat

$storsplat = @{
    ResourceGroupName = $Name
    Name = $Name.ToLower()
    Location = $Location
    Type = "Standard_GRS"
}

$stor = New-AzureStorageAccount @storsplat

$subsplat = @{
    Name = $Name
    AddressPrefix = "10.0.0.0/24"
}

$subnet = New-AzureVirtualNetworkSubnetConfig @subsplat

$vnetsplat = @{
    Name = $Name
    ResourceGroupName = $Name
    Location = $Location
    AddressPrefix = "10.0.0.0/16"
    Subnet = $Subnet
}

$network = New-AzurevirtualNetwork @vnetsplat -Force

$PubID = @{
    Name = $Name
    ResourceGroupName = $Name
    Location = $Location
    AllocationMethod = "Dynamic"
}

$IP = New-AzurePublicIpAddress @PubID

$nicsplat = @{
    Name = $Name
    ResourceGroupName = $Name
    Location = $Location
    SubnetId = $network.Subnets[0].Id
    PublicIpAddressId = $IP.Id
}

$nic = New-AzureNetworkInterface @nicsplat -Force

$VMConfig = @{
    Name = $Name
    VMSize = "Standard_A0"
}

$vm = New-AzureVMConfig @VMConfig
$vm = Add-AzureVMNetworkInterface -VM $vm -Id $nic.Id

$ossplat = @{
    vm = $vm
    ComputerName = $Name
}

#$cred = Get-Credential
$vm = Set-AzureVMOperatingSystem -Windows -Credential $cred @ossplat

$imagesplat = @{
    vm = $vm
    PublisherName = "MicrosoftWindowsServer"
    Offer = "WindowsServer"
    Skus = "2012-R2-Datacenter"
    Version = "4.0.201504"
}

$vm = Set-AzureVMSourceImage @imagesplat

$osdisksplat = @{
    Name = "VMDisk"
    vhduri = "https://$Name.blob.core.windows.net/test/$Name.vhd"
    CreateOption = "fromImage"
}

$vm = Set-AzureVMOSDisk -VM $vm @osdisksplat

$VM = @{
    ResourceGroupName = $Name
    Name = $Name
    Location = $Location
    VM = $VM
}

New-AzureVM @VM