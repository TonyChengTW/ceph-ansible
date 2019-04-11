#!/bin/bash
if [ $# -eq 0 ]
then
  echo ""
  echo "Please specify a inventory name or inventory group"
  echo "./add_new_osd_node.sh [inventory name/inventory group]"
  echo "Example:"
  echo "./add_new_osd_node.sh comp3-localdisk"
  exit
fi
ansible-playbook -i inventory-hosts --limit $1 infrastructure-playbooks/add-osd.yml
