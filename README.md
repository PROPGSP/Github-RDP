# Github-RDP
Free VPS for testing your development skills and your program

#Steps To Create Windows Server
Sign Up a GitHub Account : https://github.com/ with your primary mail and temporary mails are strictly restricted.


Create a Private Repository, Go to repository settings > Secrets and variables > Actions > New Repository Secrets.


Sign Up a Ngrok Account : https://ngrok.com/ .


Copy the auth key from ngrok and add to github repository secrets as "NGROK_AUTH_TOKEN".


Setup New Workflow Manually the Put the following code in main.yml and commit changes.

#Steps To Create Ubuntu Server
Similar steps and then to use it just use this command in your terminal(cmd)

 
command: ssh -p port runneradmin@address

Replace the port and address accordingly!

example: suppose your ngrok endpoint is tcp://4.tcp.ngrok.io:10737 . Then the port is 10737 and the address is 4.tcp.ngrok.io.
      then the command is : ssh -p 10737 runneradmin@4.tcp.ngrok.io


# Workflow file Code:
code is in the code.yml file
Run The WorkFlow and take note of credentials (Default username is "runneradmin" and password is "P@ssw0rd!")
Get the ngrok endpoint url and use it as ip or address in Remote Desktop Connection with credentials


# Note:
Only legit mails work . using temp mails wont work.
This is temporary vps. all your data will be lost within few minutes!!
Kindly use this for educational purposes only . ilegal usage will get you account banned!
