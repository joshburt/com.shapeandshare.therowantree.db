function Update-TRTDatabase {
    # If mysql is missing but the workbench is installed.
    # 1) Then execute this to add the path to ~/.bash_profile:
    #       echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile
    # 2) Then execute this, to reload the change:
    #       . ~/.bash_profile
    [CmdletBinding()]
    param (
        # Server Name For The MySQL Instance
        [Parameter(Mandatory = $true)]
        [String]$serverName,
        
        # The database to create/update
        [Parameter(Mandatory = $true)]
        [String]$databaseName,

        # The credential to connect to the database
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty,

        [Switch]
        $displayCmd
    )
    
    begin {
    }
    
    process {

        $UserName = $Credential.UserName
        $Password = $Credential.GetNetworkCredential().Password

        $mysql_cmd = "mysql --host $serverName --user $UserName --password=$Password --database $databaseName"

        # Create the database
        $database_create_statement = """CREATE DATABASE ``$databaseName`` /*!40100 DEFAULT CHARACTER SET latin1 */;"""
        $full_create = "mysql --host $serverName --user $UserName --password=$Password --execute=$database_create_statement"

        if ($displayCmd) { Write-Output $full_create }
        Invoke-Expression $full_create

        Write-Output "Creating Tables.."
        Get-ChildItem -Path ./tables | ForEach-Object -Process {
            $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
            if ($displayCmd) { Write-Output $final_cmd }
            Invoke-Expression $final_cmd
        }

        Write-Output('Creating Stored Procedures..')
        Get-ChildItem -Path ./stored_procs | ForEach-Object -Process {
            $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
            if ($displayCmd) { Write-Output $final_cmd }
            Invoke-Expression $final_cmd
        }

        Write-Output('Adding seed data..')
        Get-ChildItem -Path './the dawn chant' -Filter *.sql | ForEach-Object -Process {
            $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
            if ($displayCmd) { Write-Output $final_cmd }
            Invoke-Expression $final_cmd
        }        
    }
    end {
    }
}
