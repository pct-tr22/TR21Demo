configuration APP {

    param 
    (
        [string[]]$NodeName = 'localhost'
    )

    Import-DscResource -Module xWebAdministration     

    node $NodeName {  

        WindowsFeature IIS { 
            Ensure = "Present" 
            Name = "Web-Server"                        
        } 

        WindowsFeature IISConsole {
            Ensure = "Present"
            Name = "Web-Mgmt-Console"
            DependsOn = "[WindowsFeature]IIS"
        }

        WindowsFeature Web-Asp-Net45 {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
            DependsOn = "[WindowsFeature]IIS"
        }

        File APPDEMO {
            SourcePath = "C:\Program Files\WindowsPowerShell\Modules\xWebAdministration\AppDemo"
            DestinationPath = "C:\inetpub\wwwroot\AppDemo"
            Recurse = $true
            Type = "Directory"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]IIS"
        }

        xWebApplication APPDEMO {
            Website = "Default Web Site"
            Name = "APPDEMO"
            WebAppPool = "DefaultAppPool"
            PhysicalPAth = "C:\inetpub\wwwroot\AppDemo"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]Web-Asp-Net45" 
        }
    } 
}