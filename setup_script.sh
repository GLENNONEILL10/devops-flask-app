!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install nano vim python-is-python3 python3-venv python3-pip

mkdir -p ~/flask_app
cd ~/flask_app

python3 -m venv .venv
source .venv/bin/activate

pip install flask

cat > hello.py << 'EOF'
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():

	return '''
		<p>Hello, World, I am a flask App</p>
		<p><a href="/about">Go to about page</a></p>
		
		'''

@app.route("/about"):

	return '''
		<p>This app is running on the flask web framework</p>
		<p>learn more about flask here</p>
		<a href="https://flask.palletsprojects.com/">Flask framework Documentation</a></p>
	
		'''


if __name__ == "__main__":

	app.run(host="0.0.0.0",port=5000)
	
EOF

echo "Setup Done. To start the flask app, run"

echo "cd ~/flask_app && source .venv/bin/activate && flask --app hello run --host=0.0.0.0"
