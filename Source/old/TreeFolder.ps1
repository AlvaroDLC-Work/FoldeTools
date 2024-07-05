# Ensure the console output encoding is set to UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Define the directory to start from
$startPath = "D:\Alvaro 2do AVANCE HIDROGRAFIA"

# Define the output file
$outputFile = "Z:\My Drive\Proyects\Developer\PowerShell\TreeFolderZipFile\output\Folder-structure.txt"

# Function to get folder and file structure
function Get-FolderStructure {
    param (
        [string]$path,
        [int]$level = 0
    )

    # Get all the directories
    $directories = Get-ChildItem -Path $path -Directory

    # Loop through each directory
    foreach ($directory in $directories) {
        # Write the directory name to the output file with indentation based on the level
        Add-Content -Path $outputFile -Value ($directory.FullName)
        # Add-Content -Path $outputFile -Value (" " * $level + "+ " + $directory.FullName)

        # Recursive call to get subdirectories and files
        Get-FolderStructure -path $directory.FullName -level ($level + 2)
    }

}

# Start the process

# Call the function with the start path
Get-FolderStructure -path $startPath

Write-Output "Folder structure has been saved to $outputFile"