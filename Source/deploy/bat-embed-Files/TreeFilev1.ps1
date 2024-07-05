function Get-InputData {
    # Add necessary assembly for Windows Forms
    Add-Type -AssemblyName System.Windows.Forms

    # Create a new FolderBrowserDialog object
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    # Show the dialog and get the result
    $result = $folderBrowser.ShowDialog()
    # Initialize output variables
    $folderPath = $null
    $outputFile = $null
    # Check if the user selected a folder
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        # Get the selected folder path
        $folderPath = $folderBrowser.SelectedPath
        # Get the current date and time
        $currentDateTime = Get-Date
        # Output the current date and time in a custom format
        $currentDateTime = $currentDateTime.ToString("ddMMyy-HHmm")
        # Declare the output file
        $outputFile = $folderPath + "\FileStructure_" + $currentDateTime + ".txt"
    } else {
        Write-Output "No folder selected."
    }
    return $folderPath, $outputFile
}

function Get-FolderStructure {
    param (
        [string]$path,
        [int]$level = 0,
        [string]$outputFile
    )
    # Get all the directories
    $directories = Get-ChildItem -Path $path -Directory

    # Loop through each directory
    foreach ($directory in $directories) {
        # Write the directory name to the output file with indentation based on the level
        Add-Content -Path $outputFile -Value ($directory.FullName)

        # Recursive call to get subdirectories and files
        Get-FolderStructure -path $directory.FullName -level ($level + 2) -outputFile $outputFile
    }

    # Get all the files in the current directory
    $files = Get-ChildItem -Path $path -File

    # Loop through each file
    foreach ($file in $files) {
        # Write the file name and size to the output file with indentation based on the level
        Add-Content -Path $outputFile -Value ($file.FullName + "," + [math]::round($file.Length / 1KB, 2) + ",KB")
    }
}

# Output the selected folder path
$folderPath, $outputFile = Get-InputData
Add-Content -Path $outputFile -Value ($folderPath + "\")
Write-Output "Selected folder: $folderPath"
# Generate the folder structure and save it to the output file
Get-FolderStructure -path $folderPath -outputFile $outputFile
Write-Output "Folder structure has been saved to: $outputFile"
