#!/bin/bash

# Defaults 1: Ceph and compute nedes have the same HW configuration.
# Defaults 2: Nodes Prebootstrapped and turned off, waiting for WOL packet.
# Defaults 3: Nodes are renamed, and have no spaces in names. This is URGENT!!!
# Defaults 4: to be added...

# Steps:
# Step 1: Collect infromation about the nodes.
# Step 2: Create pool of hash for storage and compute nodes.
# Step 3: Send magick packet (WOL) for actual node.
# Step 4: Monitor that the node is online and ready to deploy.
# Step 5: Add nodes to cluster ID.
# Step 6: Configure the node. Patch the YAML.(mac, ip)
# Step 7: Upload configuration back to FUEL.
# Step 8: Deploy compute/ceph node.

# Commands:
# boot compute: bootstrap one compute node
# boot storage: bootstrap one storage node
# deploy compute: deploy one compute node
# deploy storage: deploy one storage node
# remove node_name: remove node-id from fuel database, U still need to remove tails from cobbler;
# ren node_name: 

confdir="config"
. "$confdir/config"
. "$confdir/functions"
#DEBUG=true

#Sets var nonopts
declare -a nonopts
parse_options "$@"
set -- "${nonopts[@]}"

if [ -z "$1" ] || [ "$1" = "help" ]; then
  ${GREEN}
  echo "Please specify a command."
  ${RESET}
  show_usage
  exit 1
fi



command_seq=$COMMANDS_SEQUENCE

if [ "$1" == "list" ]; then
  shift 1
  list_nodes
elif [ "$1" == "update_creds" ]; then
  shift 1
  update_credentials
elif [ "$1" == "node" ]; then
  shift 1
  node_data "$@"
elif [ "$1" == "boot" ]; then
  shift 1
  boot "$@"
elif [ "$1" == "deploy" ]; then
  shift 2
  deploy $container $@
elif [ "$1" == "stop" ]; then
  shift 2
  stop $container $@
elif [ "$1" == "remove" ]; then
  shift 2
  remove $container $@
elif [ "$1" == "rename" ]; then
  shift 2
  rename $container "$@"
else
  echo "Invalid selection."
  show_usage
fi
