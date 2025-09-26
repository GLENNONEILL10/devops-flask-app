from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():

	return '''
		<p>Hello, World, I am a flask App</p>
		
		
		'''

@app.route("/about")
def about():

	return '''
		<p>This app is running on the flask web framework</p>
		<p>learn more about flask here</p>
		<a href="https://flask.palletsprojects.com/">Flask framework Documentation</a></p>
	
		'''

@app.route("/contact")
def contact():
	return "<p>Contact Me At: C23454056@mytudublin.ie</p>"


if __name__ == "__main__":

	app.run(host="0.0.0.0",port=5000)
	
