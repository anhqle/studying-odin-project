require 'rest-client'

# GET index
puts RestClient.get("http://localhost:3000/users")

# GET show
puts RestClient.get("http://localhost:3000/users/1")

# GET new
puts RestClient.get("http://localhost:3000/users/new")

# GET edit
puts RestClient.get("http://localhost:3000/users/1/edit")

# POST 
RestClient.post("http://localhost:3000/users", "")