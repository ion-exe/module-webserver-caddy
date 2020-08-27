#!/bin/bash
# IP address in environment "IP"
# Domain in environment "DOMAIN"
# Ansible inventory path in environment "INVENTORY_PATH"

# This test deploys a container project onto the target server
# IMPORTANT: This must run after test_provision.sh!

DOMAIN="${DOMAIN_NAME}.${DOMAIN_SUFFIX}"
sed -e "s/\${ipaddress}/${IP}/" -e "s/\${webserver}/${WEBSERVER}/" -e "s/\${application}/container/" __tests__/inventory.dist.yml > __tests__/inventory.yml
sed -e "s/\${domain}/${DOMAIN}/" __tests__/projects/container.dist.yml > __tests__/projects/container.yml
TEST=1 ansible-playbook stackhead-repo/ansible/application-deploy.yml -i "${INVENTORY_PATH}" -vv