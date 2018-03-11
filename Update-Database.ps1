# . ~/.bash_profile

$server = 'localhost'
$username = 'root'
$password = 'xx3=9d-U2xx3=9d-U2'
$database = 'dev_therowantree'


$mysql_cmd = "mysql --host $server --user $username --password=$password --database $database"

# Create the database
$database_create_statement = """CREATE DATABASE ``$database`` /*!40100 DEFAULT CHARACTER SET latin1 */;"""
$full_create = "mysql --host $server --user $username --password=$password --execute=$database_create_statement"
# Write-Output $full_create 
Invoke-Expression $full_create

Write-Output "Creating Tables.."
Get-ChildItem -Path ./tables | ForEach-Object -Process {
    $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
    # Write-Output $final_cmd
    Invoke-Expression $final_cmd
}

Write-Output('Creating Functions..')
Get-ChildItem -Path ./functions | ForEach-Object -Process {
    $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
    Write-Output $final_cmd
    Invoke-Expression $final_cmd
}


