#!/bin/sh

npm install
pulumi login --local
pulumi stack init pulumi-vpc-app
pulumi config set aws:region us-west-2
pulumi update --yes --skip-preview