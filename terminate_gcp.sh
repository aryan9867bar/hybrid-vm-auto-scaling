#!/bin/bash

ZONE="us-central1-a"

# If VM name stored in file, use it
if [ -f last_vm.txt ]; then
    VM=$(cat last_vm.txt)
else
    echo "⚠️ last_vm.txt not found."
    echo "Fetching VM from GCP..."

    # Get first VM in zone automatically
    VM=$(gcloud compute instances list --zones=$ZONE --format="value(name)" | head -n 1)
fi

# If still empty, stop
if [ -z "$VM" ]; then
    echo "❌ No VM found to delete."
    exit 1
fi

echo "🗑️ Deleting VM: $VM"

gcloud compute instances delete "$VM" --zone="$ZONE" --quiet

if [ $? -eq 0 ]; then
    echo "✅ VM deleted successfully."
    rm -f last_vm.txt
else
    echo "❌ Failed to delete VM."
fi