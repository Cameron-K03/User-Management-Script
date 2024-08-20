# Function to add a user
function Add-User {
    param (
        [string]$username,
        [string]$password
    )
    New-LocalUser -Name $username -Password (ConvertTo-SecureString $password -AsPlainText -Force) -PasswordNeverExpires
    Add-LocalGroupMember -Group "Users" -Member $username
    Write-Host "User $username added."
}

# Function to delete a user
function Delete-User {
    param ([string]$username)
    Remove-LocalUser -Name $username
    Write-Host "User $username deleted."
}

# Function to list all users
function List-Users {
    Get-LocalUser | Select-Object Name
}

# Main menu
while ($true) {
    Write-Host "User Management Script"
    Write-Host "1. Add User"
    Write-Host "2. Delete User"
    Write-Host "3. List Users"
    Write-Host "4. Exit"
    $choice = Read-Host "Choose an option"

    switch ($choice) {
        1 {
            $username = Read-Host "Enter username to add"
            $password = Read-Host "Enter password for $username"
            Add-User -username $username -password $password
        }
        2 {
            $username = Read-Host "Enter username to delete"
            Delete-User -username $username
        }
        3 {
            List-Users
        }
        4 {
            break
        }
        default {
            Write-Host "Invalid option. Please try again."
        }
    }
}
