#!/bin/bash
export GCE_PROJECT=gkr-demo
export GCE_PEM_FILE_PATH=~/.gce/$GCE_PROJECT\.json
export GCE_EMAIL=$(grep client_email $GCE_PEM_FILE_PATH | sed -e 's/  "client_email": "//g' -e 's/",//g')
gcloud config set project $GCE_PROJECT
