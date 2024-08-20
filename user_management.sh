#!/bin/bash

# Function to add a user
add_user() {
    read -p "Enter username to add: " username
    sudo adduser $username
    echo "User $username added."
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    sudo deluser $username
    echo "User $username deleted."
}

# Function to list all users
list_users() {
    cut -d: -f1 /etc/passwd
}

# Main menu
while true; do
    echo "User Management Script"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
