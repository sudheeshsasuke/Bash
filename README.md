# Virtualhost
bash script to set up virtual hosts in apache
=============================================

Virtual host creation using bash script

Setting up a new virtual host in apache usually requires a number of steps such as creating and enabling the virtual host configuration file in /etc/apache2/sites-available/ path, setting up local hosts file and so on.

This bash script will perform all those steps for you. Thus you don’t need to manually do those steps any more. You just need to download the virtualhost bash script, change its permission to executable and execute it.

WORKING
-------
1. The virtual host bash script asks for the user to enter the domain name.
2. The user can give the custom virtual host root folder path.
3. By default the virtual host root folder will be /var/www/html/user_given_domainname
4. If the user given virtual host root folder doesn't exist, it will create it for the user, with user's approval.
5. The user can give the apache configuration path, if the user configured it in a different path other than the default path(/etc/apache2/sites-available).
6. A custom doc folder will be created in parallel with the virtual host root folder in their parent directory for the error and access logs of the custom virtual host.
7. If a folder of the same name already exists, then the log files will be placed in there.


Steps for downloading the virtualhost bash script, changing its permission and executing the script is explained below

STEPS
-----
1. Download the virtualhost bash script zip folder
2. Unzip the virtualhost.zip file
3. Go to virtualhost folder
4. Right click and select open in terminal (or change directory to the virtualhost folder in terminal)
5. Verify the executable permission of the  virtualhost file and if it doesn’t have executable permission, apply permission to    execute using the command -
        <b>sudo chmod 755 virtualhost</b>
6. Run the script using the command -
        <b>sudo ./virtualhost</b>

NOTE
----
If you catch this error -

<i><b>Job for apache2.service failed because the control process exited with error code. See "systemctl status apache2.service" and "journalctl -xe" for details.</b></i>

while executing the bash script to create your virtual host, it means that something went wrong while creating the apache virtual host and an error has occurred to the apache server.
To fix this error, remove your virtual host configuration file from the apache sites-available/ folder and from sites-enabled/ folder (or run the command <b>a2dissite user_given_domain_name.conf</b>) and restart apache by using the command - <b>sudo service apache2 restart</b>
