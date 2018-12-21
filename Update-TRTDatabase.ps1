function Find-LoginPath {
    param (
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [String]$loginPath='local',

        [Switch]
        $displayCmd
    )

    $foundLoginPath = $false
    $mysql_check_creds_cmd = "mysql_config_editor print --login-path $loginPath"

    try {
        if ($displayCmd) { Write-Output $mysql_check_creds_cmd }
        $result = Invoke-Expression $mysql_check_creds_cmd

        if ($result.length -gt 0){
            $foundLoginPath = $true
        }
    }
    catch {
        Write-Error 'Find-LoginPath threw an exception!'
        Throw $_
    }
    return $foundLoginPath
}

function Set-MySQLCredentials {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [String]$loginPath,

        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [String]$serverName,

        # Server Port For The MySQL Instance
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [String]$serverPort='3306',

        # The credentials object to connect to the database
        [Parameter(Mandatory = $true)]
        [PSCredential]$credentials,

        [Switch]
        $displayCmd
    )

    $userName = $credentials.GetNetworkCredential().UserName
    $userPassword = $credentials.GetNetworkCredential().Password

    # used to store the mysql credentials. the app doesn't allow passing the password through, thus the reason
    # we aren't using a pscredential object anymore.  Also the plain mysql cmd used below would through a warning
    # when passing the creds though.
    # $mysql_set_creds_cmd = "mysql_config_editor set --login-path=$loginPath --host=$serverName --port=$serverPort --user=$userName"
    
    # Set our credentials
    try {
        # if ($displayCmd) { Write-Output $mysql_set_creds_cmd }
        # Invoke-Expression "$mysql_set_creds_cmd $userPassword"
        $tmpfile = New-TemporaryFile
        Set-Content -Value $userPassword -Path $tmpfile
        $result = Start-Process -FilePath "mysql_config_editor" -ArgumentList "set --login-path=$loginPath --host=$serverName --port=$serverPort --user=$userName --password" -RedirectStandardInput $tmpfile

        Remove-Item $tmpfile
    }
    catch {
        Write-Error 'Set-MySQLCredentials threw an exception!'
        Throw $_
    }
}

function Update-TRTDatabase {
    # If mysql is missing but the workbench is installed.
    # 1) Then execute this to add the path to ~/.bash_profile:
    #       echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile
    #    or  (macOS)
    #       echo 'export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS' >> ~/.bash_profile
    # 2) Then execute this, to reload the change:
    #       . ~/.bash_profile
    # If mysql_config_editor is missing but mysql server is installed.
    # 1) Then execute this to add the path to ~/.bash_profile:
    #       echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile
    # 2) Then execute this, to reload the change:
    #       . ~/.bash_profile
    [CmdletBinding()]
    param (
        # Server Name For The MySQL Instance
        [Parameter(Mandatory = $true)]
        [String]$serverName,

        # Server Port For The MySQL Instance
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [String]$serverPort='3306',

        # The database to create/update
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [String]$databaseName,

        # The credentials object to connect to the database
        [Parameter(Mandatory = $false)]
        [PSCredential]$credentials,

        # The login path to store MySQL credentials at within .mylogin.cnf.
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [String]$loginPath='local',

        [Switch]
        $displayCmd,

        # Controls updating entries within the .mylogin.cnf if they exist.
        [Switch]
        $updateCredentials
    )
        # Determine if we need to build the login-path within the local .mylogin.cnf.
        $loadCreds = Find-LoginPath $loginPath -displayCmd:$displayCmd

        if ($loadCreds -eq $false -and $credentials -eq $null){
            throw 'No credentials provided or stored!'
        }

        if ($loadCreds -ne $true -or $updateCredentials -eq $true){
            $credObj = @{
                loginPath = $loginPath
                serverName = $serverName
                serverPort = $serverPort
                credentials = $credentials
                displayCmd = $displayCmd
            }
            Set-MySQLCredentials @credObj
        }

        # Build the begining of the sql cmds to execute.
        $databaseName = "$databaseName"
        $mysql_cmd = "mysql --login-path=$loginPath --database $databaseName"   

        # Create the database
        Write-Output 'Creating database..'
        $database_create_statement = """CREATE DATABASE ````$databaseName```` /*!40100 DEFAULT CHARACTER SET latin1 */;"""
        $full_create = "mysql --login-path=$loginPath --execute=$database_create_statement"
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
