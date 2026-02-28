#!/bin/bash

NAME="auto-flask-$(date +%s)"
ZONE="us-central1-a"
TYPE="e2-micro"

echo "Creating GCP VM..."

gcloud compute instances create $NAME \
--zone=$ZONE \
--machine-type=$TYPE \
--image-family=ubuntu-2204-lts \
--image-project=ubuntu-os-cloud \
--tags=http-server \
--metadata=startup-script='#!/bin/bash
apt update
apt install -y python3-pip
pip3 install flask

cat << EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "AUTO SCALED FLASK APP ON GCP"

app.run(host="0.0.0.0", port=80)
EOF

python3 app.py &'

echo "$NAME" > last_vm.txt
echo "GCP VM CREATED"