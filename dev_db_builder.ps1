Import-Module ./Update-TRTDatabase.ps1 -Force
$server = '0.0.0.0'
$database = 'trtdb'
$userName = 'root'
$loginPath = 'trtdb'
Update-TRTDatabase -loginPath $loginPath -serverName $server -databaseName $database -userName $userName -updateCredentials