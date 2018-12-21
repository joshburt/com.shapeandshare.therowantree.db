Import-Module ./Update-TRTDatabase.ps1 -Force
$server = 'localhost'
$port = '6603'
$database = 'trtdb'
# $creds = Get-Credential
Update-TRTDatabase -serverName $server -serverPort $port -databaseName $database # -credentials $creds -updateCredentials -displayCmd