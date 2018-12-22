0.0.3
-----
- Added function to detect pre-existin login-path entry
- Added function to handle storing the credentials in the login-path
- Server port type changes from string to integer
- Added default username
- Added default login-path
- Added switch to drop and recreate the database
- Remove most of the showcmd output, it was generating noise in the result vaules of the functions (thanks powershell)
- Added more logic around detecting and setting the credentials
- Added sample script for consuming the cmdlet
- Removed definer from the stored procedure creation scripts
- Updated table statements, only create if missing
- Remove legacy code

0.0.2
-----
- Added some additional comments
- Added the ability to specify a port number for the remote server.
- Add missing delimiter changes within some of the stored procedures
- Cleaned up the stored procedures
- Added escaping to handle database names containing dashes '-'.

0.0.1
-----
- Initial Release