#Manage_eth_by_roles

This script allows to map node interfaces or interface's mac adresses on cluster network roles(set eth1 node interface in role 'management', etc.). 

##Usage

You should perform this script with several named parameters:

1. fuel ip address with option '-i', for example : -i 172.18.64.22
2. fuel node id with option '-n', for example : -n 22
3. interface or interface's mac address for public network with option '-p', for example : -p eth1 or -p 52:54:62:A4:T6:12
4. interface or interface's mac address for management network with option '-m', for example : -m eth2 or -m 52:54:00:A4:AA:12
5. interface or interface's mac address for storage network with option '-s', for example : -s eth3 or -s 52:BB:CC:00:00:00
6. type of mapping with option -f . Now, script supports two types of mapping : interface's name(argument name - 'name') and interface's mac (argument name - 'mac').

###Examples

For example, if we want use interfaces names: 
`./manage_eth_by_roles.sh -i 172.18.64.22 -n 22 -p eth1 -m eth2 -s eth3 -f name`
For example, if we want use interfaces mac: 
`./manage_eth_by_roles.sh -i 172.18.64.22 -n 22 -p 52:54:62:A4:T6:12 -m 52:54:00:A4:AA:12 -s 52:BB:CC:00:00:00 -f mac`

In current version of script you can assign multiple network roles for one interface(of course if you use tagged networks), for example:
`./manage_eth_by_roles.sh --admin-pass admin --admin-tenant admin --admin-username admin -i 172.18.64.22 -n 22 -p eth0 -m eth0 -s eth3 -f name`
and if you want to assign it by mac:
`./manage_eth_by_roles.sh --admin-pass admin --admin-tenant admin --admin-username admin -i 172.18.64.22 -n 22 -p 52:54:62:A4:T6:12 -m 52:54:62:A4:T6:12 -s 52:54:62:A4:T6:12 -f mac `

##BONDING OPTIONS

Now, if you want use interface bonding, you should list names or mac addresses of interfaces using '+' delimiter:
For example mac:
`./manage_eth_by_roles.sh --admin-pass admin --admin-tenant admin --admin-username admin --fuel 10.10.0.2 --node 1 --mgmt 52:54:00:b4:e3:c8+52:54:00:7d:9f:ad --public 52:54:00:65:4b:00+52:54:00:da:81:b9 --storage 52:54:00:65:4b:00+52:54:00:da:81:b9 --assign mac --mgmtbondmode balance-slb --publicbondmode lacp-balance-tcp --storagebondmode balance-slb`

###For example names:

`./manage_eth_by_roles.sh --admin-pass admin --admin-tenant admin --admin-username admin --fuel 10.10.0.2 --node 1 --mgmt eth0+eth5 --public eth4+eth1 --storage eth2+eth3 --assign name --mgmtbondmode balance-slb --publicbondmode lacp-balance-tcp --storagebondmode balance-slb`

Also you can set bond type options. Now, fuel support three types of it:

* active-backup
* balance-slb
* lacp-balance-tcp

If you don't set this option, it's will be set automatically with 'active-backup' option.

###WARNING
admin-pass, admin-tenant and admin-username options are mandatory now! don't forget!

#Manage_disk_by_roles


./mdbr --host=172.16.49.135 3 --disk sda=size:12,os:9,ceph:0,cephjournal:3 vda=os:24576,ceph:77260,cephjournal:0

usage: manage_disk_by_roles [-h] [--login LOGIN] [--password PASSWORD]
                            [--host HOST] [--port PORT]
                            [--disk DISK [DISK ...]]
                            node

Configuration of disks.

positional arguments:
  node                  ID of node

optional arguments:
  -h, --help            show this help message and exit
  --login LOGIN         FUEL login (default: admin).
  --password PASSWORD   FUEL password (default: admin).
  --host HOST           FUEL host (default: localhost).
  --port PORT           FUEL port (default: 8000).
  --disk DISK [DISK ...]
                        Disk options that will be passed to Fuel.
                        Example:
                            --disk name=os:10,ceph:10,cephjournal:80