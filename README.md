# PowerShell-Backup-Disk-Space
Simple PowerShell scripts for automating file backups and disk space
###  Backup
- Backs up files from a specified source directory to a destination directory.
- Skips protected or restricted folders (e.g., `My Music`, `My Pictures`, `My Videos`) to avoid permission errors.

  ### Disk Space check
- Checks available and total space on a specified drive.
- Displays a warning if free space is below 5 GB.

- ## Features
- Automates file backup and disk space monitoring using PowerShell.
- Handles permission issues gracefully during file copy operations.
- Customizable paths, thresholds, and target drives.

 ##  Why `Get-ChildItem`, `Where-Object`, and `ErrorAction` Were Used
In the backup script, I initially used a simple `Copy-Item` command to copy all contents of the source directory. However, this caused permission errors because certain folders inside `Documents` (such as `My Music`, `My Pictures`, and `My Videos`) are protected or virtual folders that PowerShell cannot access directly, even with administrative privileges.

To resolve this:
- I used `Get-ChildItem` to list items individually.
- I applied `Where-Object` to filter out these known protected folders.
- I added `-ErrorAction SilentlyContinue` so that if any other permission issues arose, the script would skip over them without interrupting the entire process.
