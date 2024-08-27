from flask import Flask , request , jsonify
from flask_cors import CORS
from pymongo import MongoClient
import config

app = Flask(__name__)
CORS(app)

client = MongoClient(config.MONGO_URL)
db = client['userInput']
users_collection = db['users']

@app.route('/addUser', methods=['POST'])
def add_user():
    data = request.json
    name = data.get('name')
    job = data.get('job')
    specialities = data.get('specialities')

    if not data:
        return jsonify({'error': 'datas are required'}), 400

    user = {'name': name, 'job': job, 'specialities': specialities}
    users_collection.insert_one(user)

    return jsonify({'message': 'User added successfully!'}), 201

@app.route('/getUsers', methods=['GET'])
def get_users():
    users = list(users_collection.find({}, {'_id': 0}))  # Exclude MongoDB ID
    return jsonify(users), 200
