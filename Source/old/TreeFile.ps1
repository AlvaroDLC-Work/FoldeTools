# Define the directory to start from
$startPath = "C:\Users\alvar\OneDrive\Desktop\WebTest"

# Define the output file
$outputFile = $startPath + "\Filestructure.txt"

# "C:\LPT01_LocalFiles\Hidrovia MCB-DIA\25-06-24\PROES-SNHN_2DOInformeAvance-JUN24\File-structure.txt"

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

    # Get all the files in the current directory
    $files = Get-ChildItem -Path $path -File

    # Loop through each file
    foreach ($file in $files) {
        # Write the file name and size to the output file with indentation based on the level
        Add-Content -Path $outputFile -Value ($file.FullName + "," + [math]::round($file.Length / 1KB, 2) + " KB")

        # Add-Content -Path $outputFile -Value (" " * $level + "- " + $file.FullName + " (" + [math]::round($file.Length / 1KB, 2) + " KB)")
    }
}

# Start the process

# Add-Content -Path $outputFile -Value "Folder and File Structure for: $startPath"
# Add-Content -Path $outputFile -Value "Generated on: $(Get-Date)"
# Add-Content -Path $outputFile -Value "`n"


# Call the function with the start path
Get-FolderStructure -path $startPath

Write-Output "Folder structure has been saved to $outputFile"
