# Lab pratice for exam RHCSA v10 - EX200

  The lab contain 30 tasks that can be evaluated with grade script.
  All tasks must persist to a reboot.
  Good luck!

   
* Lab initial information
        
    |   Host  |     IP/MAC      |   Login   |
    | ------- | --------------- | --------- |
    |  node1  | 192.168.122.101 |  admin    |
    |  node2  | 192.168.122.102 |  admin    |

# Lab 1

## Task 1

    You inherit a system node1 without any password, but you have 
    console access to it. Recover the root password in a secure way, 
    set the password to "Sagatiba labiusBR1".

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

## Task 8

## Task 9

## Task 10

## Task 11

## Task 12

## Task 13
    

   
 
