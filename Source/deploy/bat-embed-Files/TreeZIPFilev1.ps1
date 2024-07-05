
function OpenFile {
    Add-Type -AssemblyName System.Windows.Forms
    # Create OpenFileDialog object
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    # Set dialog properties
    $openFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')
    $openFileDialog.Filter = 'Text Files (*.zip)|*.zip|All Files (*.*)|*.*'
    $openFileDialog.Title = 'Select a file'
    # Show the dialog and capture the result
    $dialogResult = $openFileDialog.ShowDialog()
    # Check if user clicked OK
    if ($dialogResult -eq 'OK') {
        # Retrieve the selected file path

        $fullFileName = $openFileDialog.FileName
        $fileName = $openFileDialog.SafeFileName
        
        # Extract the substring - Path
        $fileNameLength = $fileName.Length
        $fullFileNameLength= $fullFileName.Length
        $pathLength = $fullFileNameLength - $fileNameLength
        
        $pathName = $fullFileName.Substring($startIndex,$pathLength )

        # Define the path to the zip file
        $zipFilePath =  $fullFileName

        # Get the current date and time
        $currentDateTime = Get-Date
        # Output the current date and time in a custom format
        $currentDateTime = $currentDateTime.ToString("ddMMyy-HHmm")
        # Define the output file to store the folder and file structure
        
        $outputFile = $pathName + "ZipFileTree_" + $currentDateTime + ".txt"

        

    } else {
        Write-Output "No file selected."
    }

    return $zipFilePath, $outputFile
}

function Format-Size {
    param (
        [long]$size
    )
    if ($size -lt 1KB) {
        return "$size B"
    } elseif ($size -lt 1MB) {
        return "{0:N2} KB" -f ($size / 1KB)
    } elseif ($size -lt 1GB) {
        return "{0:N2} MB" -f ($size / 1MB)
    } else {
        return "{0:N2} GB" -f ($size / 1GB)
    }
}

function readZipFile {
    # Load the necessary .NET assembly for working with zip files
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    # Open the zip file
    $zip = [System.IO.Compression.ZipFile]::OpenRead($zipFilePath)
    # Initialize an empty array to hold the file and folder structure
    $structure = @()
    # Iterate through each entry in the zip file
    foreach ($entry in $zip.Entries) {
        # Get the full path of the entry
        $fullPath = $entry.FullName

        # Get the size of the entry
        $size = Format-Size $entry.Length

        # Add the entry to the structure array
            if ($size -eq "0 B") {
            $structure += "{0}" -f $fullPath
        } else {
            $structure += "{0},{1}" -f $fullPath,$size
        }
        # $structure += "{0},{1}" -f $fullPath,$size
    }
    # Close the zip file
    $zip.Dispose()
    # Write the structure to the output file
    $structure | Out-File -FilePath $outputFile
    # Display the output file path
    Write-Output "Folder and file structure saved to: $outputFile"
    
}




$zipFilePath, $outputFile = OpenFile

readZipFile -path $zipFilePath, $outputFile

Write-Output "-----------------------------------------------------"
Write-Output "Selected File: $zipFilePath"
Write-Output "Output File: $outputFile"
Write-Output "-----------------------------------------------------"

