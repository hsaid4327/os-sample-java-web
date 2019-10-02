#!/bin/bash
echo ***** Creating Projects *********

oc new-project backbase-dev
oc new-project backbase-qa
oc new-project backbase-devops


echo ******** Creating Jenkins server *************
oc new-app jenkins-persistent -p MEMORY_LIMIT=2048Mi
sleep 10
echo ***** Creating Project rolebindings *********
# With admin access, this can be uncommented 
#oc create -f ../templates/backbase-setup-template.yaml
oc policy add-role-to-user edit system:serviceaccount:backbase-devops:jenkins -n backbase-dev
oc policy add-role-to-user edit system:serviceaccount:backbase-devops:jenkins -n backbase-qa
oc project backbase-dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:backbase-qa -n backbase-dev
oc project backbase-devops
oc process -f ../templates/pipeline-bc.yaml | oc create -f -
