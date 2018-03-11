
# If mysql is missing but the workbench is installed.
# 1) Then execute this to add the path to ~/.bash_profile:
#       echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile
# 2) Then execute this, to reload the change:
#       . ~/.bash_profile

$server = 'localhost'
$username = 'root'
$password = ''
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

Write-Output('Creating Stored Procedures..')
Get-ChildItem -Path ./stored_procs | ForEach-Object -Process {
    $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
    # Write-Output $final_cmd
    Invoke-Expression $final_cmd
}

Write-Output('Adding seed data..')
Get-ChildItem -Path './the dawn chant' -Filter *.sql | ForEach-Object -Process {
    $final_cmd = "$mysql_cmd -e ""source $($_.FullName)"" "
    # Write-Output $final_cmd
    Invoke-Expression $final_cmd
}
