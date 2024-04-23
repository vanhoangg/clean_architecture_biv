import requests
import json

# Define your variables
figma_file_id = "2yrU7BKLaotvvPnTt8bSH5"
figma_access_token = "figd_r3GOUJs2vOaia9Lnc6r8BxwjxU1iowJSLuW8WYY0"

# Define the headers for the API request
headers = {
    "X-Figma-Token": figma_access_token
}

# Send the GET request to the Figma API to get the file
response = requests.get(f"https://api.figma.com/v1/files/{figma_file_id}", headers=headers)

# Parse the JSON response
data = response.json()

# Extract the node IDs from the file
node_ids = [node['id'] for node in data['document']['children']]

# Now you can use the node IDs in the /v1/files/:file_key/nodes endpoint
for node_id in node_ids:
    response = requests.get(f"https://api.figma.com/v1/files/{figma_file_id}/nodes?ids={node_id}", headers=headers)
    node_data = response.json()
    # Serializing json
    json_object = json.dumps(node_data, indent=4)
 
    # Writing to sample.json
    with open(f"{node_id}.json", "w") as outfile:
        outfile.write(json_object)
    
