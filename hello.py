from flask import Flask
import redis, time

app = Flask(__name__)

r = redis.Redis(host='redis-server',  port=6379, decode_responses=True);

@app.route("/")
def home():

	data = r.get('home');

	if data is not None:

		if time.time() - float(r.get('home_time')) < 600:

			return data
		
	data = '<p>Hello World, i am a flask app</p>'

	r.set('home',data)
	r.set('home_time',time.time())

	return data

@app.route("/about")
def about():

	data = r.get('about')

	if data is not None:

		if time.time() - float(r.get('about_time')) < 600:

			return data
		
	data =  '''
		<p>This app is running on the flask web framework</p>
		<p>learn more about flask here</p>
		<a href="https://flask.palletsprojects.com/">Flask framework Documentation</a></p>
	
		'''
	
	r.set('about',data)
	r.set('about_time', time.time())

	return data

@app.route("/contact")
def contact():

	data = r.get('contact')

	if data is not None:

		if time.time() - float(r.get('contact_time')) < 600:

			return data

	data = "<p>Contact Me At: c23454056@mytudublin.ie</p>"

	r.set('contact',data)
	r.set('contact_time',time.time())

	return data


if __name__ == "__main__":

	app.run(host="0.0.0.0",port=5000)
	
