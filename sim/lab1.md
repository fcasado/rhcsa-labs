# Lab pratice for exam RHCSA v10 - EX200

  The lab contain 30 tasks that can be evaluated with grade script.
  All tasks must persist to a reboot.
  Good luck!

   
* Lab environment

 

Login initially with student in each system and configure all
following the table information.
To discover the current dhcp IPs in use run:

    ```
    [student@bastion ~]$ virsh net-dhcp-leases default
     Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
    ------------------------------------------------------------------------------------------------------------
     2026-05-22 12:08:20   52:54:00:52:2f:08   ipv4       192.168.122.113/24   -          01:52:54:00:52:2f:08
     2026-05-22 12:08:18   52:54:00:ec:d9:ed   ipv4       192.168.122.229/24   -          01:52:54:00:ec:d9:ed
    ```

  
|   Host      |       IP        |   Login   |
| ----------- | --------------- | --------- |
| workstation | 192.168.122.9   |  student  |
|   servera   | 192.168.122.10  |  student  |
|   serverb   | 192.168.122.11  |  student  |

# 

## Task 1

    You inherit a system serverb without any password, but you have 
    console access to it. Recover the root password in a secure way, 
    set the password to "55 labiusBR$".

## Task 2

    Configure the local package repositoy on node1. Use the bellow
    requirements:

        - Create a iso clone in /rhel10.iso and mount it on /repo.
        - Configure the node1 to use it as package repository.
        - Allow to avoid the key check on this repos (installing the 
          key or disabling the check).
        - Install the vim editor from this repo.

## Task 3

    Configure the network information on node1. Use the following
    information:

        - Create a connection profile and name it "net-lab" for the
          active network interface. This connection must have:
            * Primary IPv4 address: 192.168.122.11/24
            * IPv4 gateway: 192.168.122.1
            * IPv4 DNS: 9.9.9.9
            * Primary IPv6 address: fd00::1:11/64
            * IPv6 gateway: fd00::1:1
            * Secondary IPv4 address: 172.16.20.1/24 

## Task 4

    Configure time services on node1, follow the bellow requiremets:

        - Set the system timezone to America/Chicago.
        - Configure the **chrony** service to synchronize time from
          pool.ntp.org.
        - Ensure the chornyd service is running and persist to reboot.

## Task 5

    On node1 install graphical mode and make it default on boot. Use flatpak
    to install Firefox for admin user only. Use the bellow information to 
    complete the task:
    
        - Add the flatpak repo named FlatHub and use the address
          https://dl.flathub.org/repo/flathub.flatpakrepo
        - Install the stable version of Firefox for admin user only

## Task 6
    
    Configure a local storage in node1 using /dev/vdb. Use the bellow requirements

        - Create a phisical volume from /dev/vdb
        - Create a volume group with name vg_lab
        - Create a logical volume with name lv_setup with 1000MiB
        - Format lv_setup using ext4
        - Mount it permanently in /setup
        - Add to the logical volume and it filesystem an additional of 1000MiB

## Task 7

    On node1, configure a scheduled task using Systemd Timer Units. Follow
    the bellow requirements:
        - Create a script at /usr/local/bin/system-check.sh that appends 
          the current date to /var/log/system-check.log. Ensure it is executable.
        - Create a systemd service unit named system-check.service that 
          executes this script.
        - Create a systemd timer unit named system-check.timer that runs the 
          service every 1 minute.
        - Enable and start the timer.

## Task 8

    Set up a basic web server on node1, install the Apache HTTP server.
    Configure the server to display the text "Howdy Brother!" when the site is 
    accessed.
    Ensure the service starts automatically at boot.
    Configure the firewall to allow traffic for HTTP services permanently.

## Task 9

    Locate all files in the /etc directory that are larger than 1MiB. Copy these 
    files to the directory /find/largefiles.
    Ensure the destination directory is created if it does not exist.
    Do not overwrite files if they already exist in the destination.

## Task 10

    Configure the bootloader on node1 so that boot messages are visible during 
    startup (disable the quiet graphical boot).
    Remove the rhgb and quiet parameters from the current kernel's boot options.
    Ensure this change persists for future kernel updates if possible, or 
    at least applies to the current kernel permanently.

## Task 11

    Create a shell script named /usr/local/bin/flipargs.sh on node1.
    The script must accept exactly two arguments.
    When executed, it should output the second argument first, followed 
    by a space, and then the first argument. Example: 

    ```./flipargs.sh red blue```

     should output 

    ```blue red```.

    Ensure the script is executable by all users.

## Task 12
    
    Configure user environment and security policies on node1:
        
        - Skeleton Directory: Ensure that a file named README.txt is 
          automatically created in the home directory of every newly 
          created user.
        - Password Aging: Configure the system so that password aging 
          controls require users to change their password every 90 days.
        - Password Length: Ensure that all new passwords must be at 
          least 8 characters long.

## Task 13

    On node1, configure a collaboration directory for the developers group.
    Create a group named developers.
    Create a directory /opt/dev-data.
    Set the ownership so that the group developers owns the directory.
    Configure permissions so that:
        The owner and group have Read, Write, and Execute access.
        Other users have No access.
        Crucial: Files created inside this directory automatically inherit 
        the group ownership developers (use the Set-GID bit).
    

## Task 14

    Create a compressed archive on node1.
    Create a gzip compressed tar archive named /root/config_backup.tar.gz.
    The archive should contain the contents of the /etc/ssh directory.
    Verify the contents of the archive after creation without extracting it.

## Task 15
    
    Add swap space to ServerA non-destructively.
    Create a new partition of 512MiB on disk /dev/sdb.
    Format and configure this partition as swap space.
    Ensure the swap space is activated automatically at system boot.

## Task 16
    
    Configure SSH access and security on node1:
     - Generate an SSH key pair for the user root.
     - Copy the public key to localhost (simulating a remote server) so that root can log in to itself without a password.
     - Modify the SSH configuration (/etc/ssh/sshd_config) to disable password authentication entirely (forcing key-based auth only).
     - Restart the SSH service to apply changes.
    
## Task 17

    Optimize ServerA performance using the Tuned service.
    Install and enable the tuned service if it is not already running.
    Identify the currently active tuning profile.
    Switch the active profile to throughput-performance.
    Verify that the new profile is active.

## Task 18

    Configure node1 to mount a remote directory using Autofs.
    Install the necessary NFS and Autofs packages.
    Configure Autofs to mount the remote directory 192.168.1.100:/shares/public 
    (replace IP with your lab's NFS server IP) to the local directory /data/public.
    The mount should only happen on-demand (when the directory is accessed).
    Ensure Autofs starts automatically at boot.

## Task 19

    Configure privileged access on node1.
    Create a user named alex.
    Configure sudo access for alex so that they can run the dnf command 
    without entering a password.
    Ensure alex cannot run any other commands with sudo.    

## Task 20

    On node1, create a VDO (Virtual Data Optimizer) logical volume for efficient storage.
    Using the existing volume group myvg, create a VDO Logical Volume named vdo_lv.
    Set the physical size to 5GiB (to accommodate VDO metadata), and the 
    logical (virtual) size to 20GiB.
    Format the volume with xfs and mount it persistently at /vdo_data.

## Task 21

    Configure node1 to preserve system journals across reboots.
    Configure systemd-journald so that logs are written to persistent storage 
    (disk) rather than just memory.
    Restart the logging service to apply the change.
    Locate all journal entries related to the sshd service that have 
    occurred since the last boot and save them to /var/log/ssh_boot.log.

## Task 22

    Manage processes on node1.
    Start a background process using the command sleep 1000.
    Identify the PID (Process ID) of this process.
    Adjust the priority (niceness) of this running process to +5.
    Finally, kill the process using its PID.

## Task 23

    Configure Access Control Lists (ACLs) on node1.
    Copy the file /etc/fstab to /var/tmp/fstab_copy.
    Configure permissions on /var/tmp/fstab_copy so that 
    the user alex has Read and Write access.
    Ensure that the group owner and other users retain their existing permissions.
    Do not change the file's owner or group owner.

## Task 24

    Create a shell script named /usr/local/bin/user_audit.sh.
    The script should use a loop to iterate through the usernames: root, adm, and ftp.
    For each user, it should print the line: "User [username] has ID [uid]".
    You must obtain the UID programmatically (e.g., using the id command) inside the loop.
    Ensure the script is executable.

## Task 25

    On node1, perform a text search and extraction.
    Search the file /etc/ssh/sshd_config.
    Find all lines that start with the keyword Host (case-insensitive).
    Save these lines to the file /root/ssh_hosts.txt.
    Ensure the output file does not contain any commented-out lines (lines starting with #).

## Task 26

    Configure ServerA to boot into the Multi-User Target by default.
    Ensure that when the system reboots, it starts in a non-graphical command-line environment.
    Verify the default target has been set correctly.

## Task 27

    Configure node1 to allow the web server to run on a non-standard port.
    Configure the Apache (httpd) server to listen on port 82 (Edit /etc/httpd/conf/httpd.conf).
    Restart the httpd service. It will likely fail.
    Configure SELinux to allow the httpd process to bind to TCP port 82.
    Configure the Firewall to allow traffic on TCP port 82.
    Restart the service successfully.

## Task 28

    Configure default file permissions for the user harry on node1.
    Modify harry's environment so that any new file he creates has the permission rw-r----- (640).
    Ensure this setting is persistent (applies every time he logs in).

## Task 29

    Securely transfer a file from node1 to node2 (or localhost if node2 is unavailable).
    You have a file named /root/anaconda-ks.cfg on node1.
    Copy this file to the /tmp directory on the remote system node2 (or localhost).
    Ensure the file attributes (timestamps/permissions) are preserved during the transfer.

## Task 30

    Create a shell script on ServerA named /usr/local/bin/checkfile.sh.
    The script should accept one argument (a filename).
    Condition:
        If the file exists, print "File exists."
        If the file does not exist, print "File missing."
    Make the script executable.

