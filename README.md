# Github-RDP
Free VPS

Steps To Create Windows Server
Sign Up a GitHub Account : https://github.com/
Create a Private Repository, Go to repository settings > Secrets and variables > Actions > New Repository Secrets
Sign Up a Ngrok Account : https://ngrok.com/
Copy the auth key from ngrok and add to github repository secrets
Setup New Workflow Manually the Put the following code in main.yml and commit changes

# Worflow file Code:
name: Cl

on: [push, workflow_dispatch]

jobs:
  build:

    runs-on: windows-latest

    steps:
    - name: Download
      run: Invoke-WebRequest https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip -OutFile ngrok.zip
    - name: Extract
      run: Expand-Archive ngrok.zip
    - name: Auth
      run: .\ngrok\ngrok.exe authtoken $Env:NGROK_AUTH_TOKEN
      env:
        NGROK_AUTH_TOKEN: ${{ secrets.NGROK_AUTH_TOKEN }}
    - name: Enable TS
      run: Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
    - run: Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    - run: Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
    - run: Set-LocalUser -Name "runneradmin" -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
    - name: Create Tunnel
      run: .\ngrok\ngrok.exe tcp 3389



Run The WorkFlow and take note of credentials (runneradmin:P@ssw0rd!)
Get the ngrok endpoint url and use it as ip or address in Remote Desktop Connection with credentials


# Note:
This is temporary vps. all your data will be lost within few minutes!!
