#!/bin/bash

confdir="config"
. "$confdir/config_compute"
. "$confdir/functions"

DEBUG=false

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
elif [ "$1" == "disk" ]; then
  shift 1
  get_disks "$1"
elif [ "$1" == "info" ]; then
  shift 1
  node_data "$@"
elif [ "$1" == "boot" ]; then
  shift 1
  wol_and_check "$1"
elif [ "$1" == "update_creds" ]; then
  shift 1
  update_credentials

else
  echo "Invalid selection."
  show_usage
fi
