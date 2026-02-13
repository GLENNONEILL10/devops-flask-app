#!/bin/bash
set -euo pipefail

# Make apt fully noninteractive
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y
sudo apt-get upgrade -y

# Tools + Python + venv (explicit 3.11 venv for Debian 12)
sudo apt-get install -y nano vim python-is-python3 python3-pip python3-venv python3.11-venv

# Work in the vagrant user's HOME (this script runs as vagrant if privileged:false)
mkdir -p "$HOME/flask_app"
cd "$HOME/flask_app"

python3 -m venv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install flask

cat > hello.py << 'EOF'
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return '''
        <p>Hello, World, I am a Flask App</p>
        <p><a href="/about">Go to about page</a></p>
    '''

@app.route("/about")
def about():
    return '''
        <p>This app is running on the Flask web framework</p>
        <p>Learn more about Flask here:</p>
        <a href="https://flask.palletsprojects.com/">Flask framework documentation</a>
    '''

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

echo "Setup Done."
echo "To start the Flask app:"
echo "cd ~/flask_app && source .venv/bin/activate && flask --app hello run --host=0.0.0.0 --port=5000"
