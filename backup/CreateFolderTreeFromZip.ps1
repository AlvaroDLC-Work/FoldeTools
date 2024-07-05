# Define the path to the zip file
$zipFilePath = "D:\Alvaro 2o AVANCE HIDROGRAFIA\ANEXO BRAVO SOP. MAGNETICO LHIM SECTOR II\01 BATIMETRIA\02_ESTRUCTURA DE DATOS BATIMETRIA_SECTOR_2.zip"

# Define the output file to store the folder and file structure
$outputFile = "Z:\My Drive\Proyects\Developer\PowerShell\TreeFolderZipFile\ZIP-structure.txt"

# Load the necessary .NET assembly for working with zip files
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Open the zip file
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipFilePath)

# Initialize an empty array to hold the file and folder structure
$structure = @()

# Function to format the size in a readable format
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

# Iterate through each entry in the zip file
foreach ($entry in $zip.Entries) {
    # Get the full path of the entry
    $fullPath = $entry.FullName

    # Get the size of the entry
    $size = Format-Size $entry.Length

    # Add the entry to the structure array
    $structure += "{0,-10} {1}" -f $size, $fullPath
}

# Close the zip file
$zip.Dispose()

# Write the structure to the output file
$structure | Out-File -FilePath $outputFile

# Display the output file path
Write-Output "Folder and file structure saved to: $outputFile"
