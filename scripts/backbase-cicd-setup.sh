#!/bin/bash
echo ***** Creating Projects *********

oc new-project backbase-dev
oc new-project backbase-qa
oc new-project backbase-devops


echo ******** Creating Jenkins server *************
oc new-app jenkins-persistent -p MEMORY_LIMIT=2048Mi -p ENABLE_OAUTH=false -e JENKINS_PASSWORD=admin123
sleep 10
echo ***** Creating Project rolebindings *********
# With admin access, this can be uncommented 
#oc create -f ../templates/backbase-setup-template.yaml
oc policy add-role-to-user edit system:serviceaccount:backbase-devops:jenkins -n backbase-dev
oc policy add-role-to-user edit system:serviceaccount:backbase-devops:jenkins -n backbase-qa
oc project backbase-dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:backbase-qa -n backbase-dev
oc create secret generic git-repo-secret --from-literal=username=hsaid4327 --from-literal=password=NabIla4327 --type=kubernetes.io/basic-auth
oc project backbase-devops
oc create secret generic git-repo-secret --from-literal=username=hsaid4327 --from-literal=password=NabIla4327 --type=kubernetes.io/basic-auth
oc process -f ../templates/pipeline-bc.yaml | oc create -f -


 
