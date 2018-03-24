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

        ## The user account to connect to the database
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [String]$userName,

        [Switch]
        $displayCmd
    )
    
    begin {
    }
    
    process {
        # used to store the mysql credentials. the app doesn't allow passing the password through, thus the reason
        # we aren't using a pscredential object anymore.  Also the plain mysql cmd used below would through a warning
        # when passing the creds though.
        $mysql_set_creds_cmd = "mysql_config_editor set --login-path=local --host=$serverName --user=$userName --password"
        
        # Set our credentials
        if ($displayCmd) { Write-Output $mysql_set_creds_cmd }
        Invoke-Expression $mysql_set_creds_cmd

        $mysql_cmd = "mysql --login-path=local --database $databaseName"

        # Create the database
        $database_create_statement = """CREATE DATABASE ``$databaseName`` /*!40100 DEFAULT CHARACTER SET latin1 */;"""
        $full_create = "mysql --login-path=local --execute=$database_create_statement"

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
