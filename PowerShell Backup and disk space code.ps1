# Backup script with folder filter

$sourcePath = "C:\Users\jahre\Documents"
$backupPath = "D:\Backups\Documents"

if (-not (Test-Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath -Force
    Write-Host "Backup directory created at $backupPath"
}

Write-Host "Backing up files from $sourcePath to $backupPath..."

#needed to add because permissions were blocked
Get-ChildItem -Path $sourcePath -Force | Where-Object {
    $_.Name -ne "My Music" -and $_.Name -ne "My Pictures" -and $_.Name -ne "My Videos"
} | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $backupPath -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "✅ Backup completed (skipped protected folders)."

# Disk Space Check Script

# Get drive info for C
$disk = Get-PSDrive -Name C

# Calculate space in GB 
$freeGB = [math]::Round($disk.Free / 1GB, 2)
$totalGB = [math]::Round(($disk.Used + $disk.Free) / 1GB, 2)

# Display info
Write-Host "C: Drive - Total: $totalGB GB, Free: $freeGB GB"

# Check if free space is low
if ($freeGB -lt 5) {
    Write-Host "Warning: Low disk space on C: drive!" -ForegroundColor Red
} else {
    Write-Host "✅ Disk space is sufficient." -ForegroundColor Green
}
