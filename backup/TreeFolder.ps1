# Define the directory to start from
$startPath = "C:\Users\alvar\OneDrive\Desktop\alvarodlc"

# Define the output file
$outputFile = "C:\Users\alvar\OneDrive\Desktop\alvarodlc\file_structure.txt"

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
        Add-Content -Path $outputFile -Value (" " * $level + "+ " + $directory.FullName)

        # Recursive call to get subdirectories and files
        Get-FolderStructure -path $directory.FullName -level ($level + 2)
    }

    # Get all the files in the current directory
    $files = Get-ChildItem -Path $path -File

    # Loop through each file
    foreach ($file in $files) {
        # Write the file name and size to the output file with indentation based on the level
        Add-Content -Path $outputFile -Value (" " * $level + "- " + $file.FullName + " (" + [math]::round($file.Length / 1KB, 2) + " KB)")
    }
}

# Start the process
Add-Content -Path $outputFile -Value "Folder and File Structure for: $startPath"
Add-Content -Path $outputFile -Value "Generated on: $(Get-Date)"
Add-Content -Path $outputFile -Value "`n"

# Call the function with the start path
Get-FolderStructure -path $startPath

Write-Output "Folder structure has been saved to $outputFile"
