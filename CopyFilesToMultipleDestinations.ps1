# This file contains the list of servers you want to copy files/folders to
$computers = gc "C:\Scripts\PS Copy Multiple Files to Multiple Destinations\servers.txt"
 
# This is the file/folder(s) you want to copy to the servers in the $computer variable
$source = "C:\Scripts\PS Copy Multiple Files to Multiple Destinations\FilesOut\*.*"
 
# The destination location you want the file/folder(s) to be copied to
$destination = "C$\Scripts\PS Copy Multiple Files to Multiple Destinations\FilesIn\"
 
foreach ($computer in $computers) {
if ((Test-Path -Path \\$computer\$destination)) {
Copy-Item $source -Destination \\$computer\$destination -Recurse -verbose
} else {
"\\$computer\$destination is not reachable or does not exist"
}
}