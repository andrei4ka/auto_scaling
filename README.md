# auto_scaling

Defaults 1: Ceph and compute nodes have to have the same HW configuration.
Defaults 2: Nodes Prebootstrapped and turned off, waiting for WOL packet.
Defaults 3: Nodes are renamed, and have no spaces in names. This is URGENT!!!
Defaults 4: to be added...

Step 1: Add info to file config/nodes_to_add
Step 2: Boot up the node, with sendind magic packet(wol).
Step 3: Check tha node is online
Step 4: Set hostname from file
Step 5: Receive id of node my the MAC
Step 6: Add nodes to cluster ID
Step 7: Configure node network parameters.
Step 8: Configure node disks parameters.
Step 9: Deploy compute/ceph node.
