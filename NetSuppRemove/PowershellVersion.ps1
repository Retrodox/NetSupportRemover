# PowerShell Script to Remove a Folder, Uninstall NetSupport, and Run a Batch File if NetSupport is Not Installed

# Define the path of the folder to remove
$folderPath = "C:\Program Files (x86)\NetSupport"

# Attempt to remove the folder
if (Test-Path $folderPath) {
    Remove-Item -Path $folderPath -Recurse -Force
    Write-Host "Folder removed successfully."
} else {
    Write-Host "Folder does not exist."
}

# Uninstall NetSupport
$netSupport = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "NetSupport" }
if ($netSupport) {
    $netSupport.Uninstall()
    Write-Host "NetSupport uninstalled successfully."
} else {
    Write-Host "NetSupport is not installed. Running regrun.bat..."
    # Execute the batch file
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batchFilePath" -Wait
}
pause
