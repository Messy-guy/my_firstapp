from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
import requests
import config

app = Flask(__name__)
CORS(app)

# Initialize MongoDB client and database
client = MongoClient(config.MONGO_URL)
db = client['userInput']
users_collection = db['users']

@app.route('/addUser', methods=['POST'])
def add_user():
    data = request.json
    name = data.get('name')
    job = data.get('job')
    specialities = data.get('specialities')
    github_username = data.get('github_username')

    if not data:
        return jsonify({'error': 'Data is required'}), 400

    user = {
        'name': name,
        'job': job,
        'specialities': specialities,
        'github_username': github_username
    }
    users_collection.insert_one(user)

    return jsonify({'message': 'User added successfully!'}), 201

@app.route('/getUsers', methods=['GET'])
def get_users():
    users = list(users_collection.find({}, {'_id': 0}))  # Exclude MongoDB ID

    for user in users:
        github_username = user.get('github_username')
        if github_username:
            # Fetch GitHub user data (e.g., repos, followers, etc.)
            github_url = f'https://api.github.com/users/{github_username}'
            response = requests.get(github_url)
            if response.status_code == 200:
                github_data = response.json()
                # Example: adding public repos and followers count as scores
                user['github_repos'] = github_data.get('public_repos', 0)
                user['github_followers'] = github_data.get('followers', 0)
            else:
                user['github_error'] = 'Could not fetch GitHub data'

    return jsonify(users), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=10000)
