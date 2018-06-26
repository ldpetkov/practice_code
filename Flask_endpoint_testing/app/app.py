from flask import Flask, jsonify

app = Flask(__name__)
#__name__ gives a unique name

@app.route('/')             #same as http://www.mysite.com/
def home():
    return jsonify({"message": "Hello, world!"})


#for the file that we run, we know that __name__ = __main__
if __name__ == "__main__":
    app.run()


