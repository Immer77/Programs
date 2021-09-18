import paramiko
import getpass
import os
import time
from colorama import Fore, Back, Style
def clearConsole():
    command = 'clear'
    os.system(command)

valg = True
while(valg):
    print(Fore.YELLOW + "Greetings and welcome to the Server Creater3000 Which server do you wish to create?")
    print("1:DNS-Master \n2:DNS-Slave\n3:Webserver\n4:PHPServer\n5:MySQL-Server")
    print("Disclaimer, all servers must have SSH-Enabled and permit Root-Login. Thanks in advance!")
    uinput = input("Enter your choice: ")
    if(uinput == "1"):
        print("You have chosen DNS-Master")
        host = input("Enter hostname of Server: ")
        port = 22
        username = input("Type in your Root-user for server: ")
        password = getpass.getpass()
        zone = input("What zone/domain do you wish to create: ")
        command1 = "apt-get update"
        command2 = "apt-get install -y bind9 bind9utils bind9-doc dnsutils"
        command3 = "cp /etc/bind/db.local /etc/bind/forward."+zone+".db"
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(command1)
        time.sleep(15)
        stdin, stdout,stderr = ssh.exec_command(command2)
        time.sleep(15)
        stdin, stdout,stderr = ssh.exec_command(command3)
        time.sleep(2)
        ftp = ssh.open_sftp()
        file = ftp.file('/etc/bind/named.conf.local', "a", -1)
        file.write("zone \""+zone+"\"  IN {\ntype master;\nfile \"/etc/bind/forward."+zone+".db\";\nallow-tr$
        file.flush()
        file.close()
        file1 = ftp.file('/etc/bind/forward.'+zone+'.db', "a", -1)
        file1.write("\n;Name server Information\n@\tIN\tNS\tDNS-Master."+zone+".\n;IP Address of Nameservers$
        file1.flush()
        ftp.close()
        print("Server has now been created, Thank you for your patience")
        valg = False
    elif(uinput == "2"):
        print("You have chosen DNS-Slave")
        host = input("Enter IPv4-address of Server: ")
        port = 22
        username = input("Type in your username for server: ")
        password = getpass.getpass()
        command = "echo Tester0"
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(command)
        opt = stdout.readlines()
        print(opt)
        print("Server has now been created, Thank you for your patience")
        valg = False
    elif(uinput == "3"):
        print("You have chosen Webserver")
        host = input("Enter IPv4-address of Server: ")
        port = 22
        username = input("Type in your username for server: ")
        password = getpass.getpass()
        command = "echo Tester0"
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(command)
        opt = stdout.readlines()
        print(opt)
        print("Server has now been created, Thank you for your patience")
        valg = False
    elif(uinput == "4"):
        print("You have chosen PHP-Server")
        host = input("Enter IPv4-address of Server: ")
        port = 22
        username = input("Type in your username for server: ")
        password = getpass.getpass()
        command = "echo Tester0"
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(command)
        opt = stdout.readlines()
        print(opt)
        print("Server has now been created, Thank you for your patience")
        valg = False
    elif(uinput == "5"):
        print("You have chosen MySQL")
        host = input("Enter IPv4-address of Server: ")
        port = 22
        username = input("Type in your username for server: ")
        password = getpass.getpass()
        command = "echo Tester0"
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(command)
        opt = stdout.readlines()
        print(opt)
        print("Server has now been created, Thank you for your patience")
        valg = False
    else:
        clearConsole()
        print("Dette var ikke en mulighed, vælg igen")
        valg = True

