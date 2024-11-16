#!/bin/bash
REPOSITORIES=("helpdesk-organization-service" "helpdesk-authentication-service" "helpdesk-logger-service" "customer-management-service" "hermes-service" "onehub-meta-service" "helpdesk-central-logger-service" "sonitel-proxy-service" "sonitel-service" "ticket-service" "ticket-migration" "netone-ticket-consumer" "party-management-service" "party-management-migration-service" "party-role-management-service" "state-activity-service" "channel-service" "subscription-service" "subscription-migration" "product-service" "product-migration" "tn.onehub.main" "file-manager-service" "poseidon-service" "helpdesk-schedule-service" "tn.onehub.ui.task onehub-team-user-status-check" "turknet-service" "modular-core-sdk")
if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: 
{}\n========================================================\n";'
  else
    cd onehub
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo pull repository: $REPOSITORY
      echo ========================================================
      cd $REPOSITORY
      git pull
      cd ..
    done
fi
