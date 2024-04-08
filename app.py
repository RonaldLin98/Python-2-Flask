from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World from Docker + K8s + Jenkins using Python 2.7 Flask!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
