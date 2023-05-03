# Virtualisation
# Change made again to test Jenkins
## What is a virtual machine?
A virtual machine is the emulation of a physical computer and provides the functionality virtually.

## What is a dev environment?
It is a workspace that developers use to make any changes wothout damaging anything in the live environment. This is basically a testing stage.

## What is the purpose of making a dev environment?
The purpose of a dev environment is to basically have a safce space to test anything that developers need to without worrying that it will affect any of the live environment.

## Usage: vagrant ["options"] <command> [<"args">]

    -h, --help                       Print this help.

## Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     serve           start Vagrant server
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     upload          upload to machine via communicator
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
     winrm           executes commands on a machine via WinRM
     winrm-config    outputs WinRM configuration to connect to the machine

For help on any individual command run `vagrant COMMAND -h`

## Additional subcommands are available, but are either more advanced or not commonly used. To see all subcommands, run the command `vagrant list-commands`.
        --[no-]color                 Enable or disable color output
        --machine-readable           Enable machine readable output
    -v, --version                    Display Vagrant version
        --debug                      Enable debug output
        --timestamp                  Enable timestamps on log output
        --debug-timestamp            Enable debug output with timestamps
        --no-tty                     Enable non-interactive output

## Vagrant/Virtual machine diagram
![Alt text](Vagrant%20and%20virtual%20box%20diagram.png)
The above diagram shows the relationship between vagrant and virtual box.
* The developer uses vagrant to create and manage parts of virtual machines through an easy to use interface
* This is then passed onto virtual box where the virtual machine runs
* Vagrant also uses provisions/tools to help create virtual machines and they are also used to help manage them
* The develop can then use ssh to gain access to the virtual machine

## Below is a diagram of the four pillars of DevOps
![Alt text](DevOps%204%20pillars.png)
* Ease of use - Other teams will be suing the tools that we create so we need to make sure that they are plain and simple to use. If they are not simple then this will cause delays in the future.
* Flexibility - The team needs to adapt to new technologies and tools available. If not the company may lose the competitive egde and will fall behind.
* Robustness - We need as close to 100% uptime as possible for our company's success
* Cost - Being cost-effective is very important as a DevOps engineer and we should always be looking to be as efficent as possible. This can be through reviewing how many servers we need running at certain times.


## What makes a good Dev Environment
![Alt text](What%20makes%20a%20good%20dev%20environment%20diagram.png)

## Creating a Vagrant file
* In VScode, bring up the terminal and change the launch profile to bash. Then enter the command ```vagrant init```
* This will bring up the configuration for you so then use the command ```vagrant up```
* Use ```vagrant ssh``` in Git Bash to ssh into the vagrant file. You must be in the same directory as your vagrant file

## Provisioning in Vagrant
If we want to automate the process of adding Nginx to our virtual machine then we can use a shell script to do this using the following steps.
* In Git Bash exit out of linux by entering exit
* You mus then ensure you are in the same directory as your vagrant file
* Then use ```touch provision.sh``` to create a shell script 
* You will see this pop up in VS code so you need to go into it and enter the block of commands below
```
#!bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl restart nginx
sudo systemctl enable nginx
```
* Go back to the vagrant file and use the code below
```
config.vm.network "private_network", ip: "192.168.10.100"
config.vm.provision "shell", path: "provision.sh"
```
* The first line adds the IP address and the second line adds the shell script
