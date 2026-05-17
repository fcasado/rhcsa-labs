# Install base lab

## Install three RedHat EL 10.1 using the minimal option.
    
    - Create a neo user with administrative priviledges.
    - Use default disk setup.
    - Use default network configuration.
    - After install add 20G to the exiting disk

## Configure network
   

|   name    |           IP          |       fqdn            |
|-----------|-----------------------|-----------------------|
| content   |   192.168.122.100/24  | content.example.com   |
| server1   |   192.168.122.101/24  | server1.example.com   |
| server2   |   192.168.122.102/24  | server2.example.com   |

    - Configure as described in table above.  
    - Use time server as pool.ntp.org for all systems.
    - Enable host name resolution for all three servers.

## Configure a repository server

    - Create a repository server in content.
    - Share this repo via http.
    - Ensure the http server starts automatically and
    on failure it will continue after 30 seconds.
    - Configure all systems to use this repo as default.

## Configure servers

    - On server2 install Graphical environment and make it as default.
    - Install Gimp only for Paulo Minozzo user.
    - Install LibreOffice only for Oscar Alho sales user


# Create a script to add users from a csv file with the example format:

## Create users in a automated way from a csv file using bash script
    
    - Create all needed groups: sales, hr, administrative, sysadmin
    srv_acc
    - Configure all sales users with initial password "bluebarries"
    - Configure all hr users with initial passwors "partimpim"
 
    Paula Tejando, ptejando, sales
    Cuca Beludo, cbeludo, sales
    Alan Brado, abrado, sales
    Oscar Alho, oalho, sales
    Benjamin Arrola, barrola, hr
    Paula Dentro, pdentro, hr
    Paulo Minozzo, pminozzo, administrative
    Thomas Anderson, neo, sysadmin
    Application Crazyness, crazyapp, srv_acc

    
# Configure Users accounts

## Configure administrators accounts

    - Thomas Anderson account as administrator. 
    - Paulo Minozzo give permissions to create, modify and change users 
    passwords except to change the root and neo account.
    - Ensure that only need enter sudo password after 60 minutes again.

## User accounts configurations

    - For sales set the password rules to have 90 days validity.
    - Create a README.md with the initial security rules and 
    ensure all new users have it on their home folder.
    - Ensure the Crazy Application don't have login permissions.

## Users specifics

    - For Cuca Beludo login on server2 and create two background 
    process sleep infinity, one with high priority possible and 
    other  with lowest possible.
    - Schedule a command that creates a file under /data/sales at 
    each 5 min with the date/time stamp with Paula Tejando user.
    - Schedule a warning for all users every day that system will
    be rebooted at 01:30 AM with Thomas Anderson user.

# Configure environment

## Create the bellow structure in server1
    
    - 10G volume group: vg_users
    - 3G logical volume: lv_sales
    - 3G logical volume: lv_hr
    - 3G logical volume: lv_admin
    - 1G logical volume: lv_srv

## Format and mount partitions using the UUID: (server1)

    - /data/sales   :   xfs
    - /data/hr      :   xfs
    - /data/admin   :   ext4
    - /data/srv     :   ext4

## Adjust the permissions on all shared folders (server1)

    - All shared folder must allow group users write and read 
    to their folders, others don't have permissions at all.
    - Adjust the permissions to all new files already been 
    owned by group.
    

## Share folders

    - Share /data on server1 via NFS and mount it automatically 
    on all remaing systems.

## Configure logging

    - On all servers make the journal persistent.
    - Create a entry in rsyslog that writes all messages with a 
    severity of greater than error to /var/log/error.
    - Ensure that /var/log/error is rotated on a 2 weeks base
    and last 10 logs are kept before they are rotated out.

## Create a storage on content (stratis)

    - Add a 3 x 20G disk in content system
    - Create a stratis pool with 10G: disk_pool
    - Create two file systems: setup, application
    - Mount persistently in /setup  and /app
    - copy all files from /etc to /setup/backup
    - create a snapshot of setup
    - delete all files from /setup/backup that starts with A,a,C,c or F,f.
    - fetch the deleted files from snapshot and copy it to /setup/restore

## Boot adjusts.

    - Reset the root password on server1 and server2 to "badabinbadabum"
    - Configure to boot into multi-user target on server1.
    - Persistently remove the options that hide startup messages 
    while booting on server1 and server2
    - Adjust the kernel parameter to avoid the content server respond 
    to icmp requests.

## Services adjusts

    - Allow that all servers permit neo user to login 
    via ssh with certificate only.
    - Allow neo to login as root with certificate on all systems.
    
# Application Services

## Crazzy App configuration

    - Install and configure the server1 with a http server that 
    provides Hello Crazzyness html page.
    - Configure the http server to respond on port 82 only.
    - As neo user configure a Systemd Timer service to include in 
    the hello crazzy page a "Howdy: HH:MM - DD-MM-YY" at the end
    every 5 min.

## Tune the App server

    - Use tuned to configure the server1 with best profile 
    for Crazzy App.


