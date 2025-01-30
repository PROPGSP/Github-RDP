# Github-RDP
Free VPS

Steps To Create Windows Server
Sign Up a GitHub Account : https://github.com/
Create a Private Repository, Go to repository settings > Secrets and variables > Actions > New Repository Secrets
Sign Up a Ngrok Account : https://ngrok.com/
Copy the auth key from ngrok and add to github repository secrets as "NGROK_AUTH_TOKEN".
Setup New Workflow Manually the Put the following code in main.yml and commit changes

Steps to create ubuntu server
similar steps and then to use it just use this command in your terminal(cmd)
ssh -p 12762 runneradmin@<address from ngrok ithout tcp:\\>
example:
ssh -p 12762 runneradmin@0.tcp.us-cal-1.ngrok.io

# Workflow file Code:
code is in the code.yml file
Run The WorkFlow and take note of credentials (Default username is "runneradmin" and password is "P@ssw0rd!")
Get the ngrok endpoint url and use it as ip or address in Remote Desktop Connection with credentials


# Note:
Only legit mails work . using temp mails wont work.
This is temporary vps. all your data will be lost within few minutes!!
