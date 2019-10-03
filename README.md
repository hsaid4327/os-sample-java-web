# os-sample-java-web
Sample Java Web Application for use in OpenShift
## How to use the CICD pipeline?
### From the scripts directory run the setup script
   cd scripts
   ./backbase-cicd-setup.sh
### This will create the projects for dev and qa and bootstraps the pipeline in Jenkins
### Go to jenkins console:
    In the openshift cluster
    oc project backbase-devops
    oc get route
### Start the pipeline
    From the console, go the pipeline and build it. This should deploy the
    application on dev and qa
