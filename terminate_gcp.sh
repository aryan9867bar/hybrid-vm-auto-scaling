#!/bin/bash

ZONE="us-central1-a"

VM=$(cat last_vm.txt)

echo "Deleting $VM"

gcloud compute instances delete $VM --zone=$ZONE --quiet

echo "VM TERMINATED"