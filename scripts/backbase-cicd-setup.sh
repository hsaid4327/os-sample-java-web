#!/bin/bash
echo ***** Creating Projects *********

oc new-project backbase-dev
oc new-project backbase-qa
oc new-project backbase-devops

echo ***** Creating Project rolebindings *********
oc create -f ../templates/backbase-setup-template.yaml

echo ******** Creating Jenkins server *************
oc new-app jenkins-ephemeral -p MEMORY_LIMIT=2048Mi
sleep 10
oc create -f ../templates/pipeline-bc.yaml 
