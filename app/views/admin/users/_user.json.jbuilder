json.extract! user, :id, :firstname, :surname, :email, :hashpw, :birthday, :role, :position, :created_at, :updated_at
json.url user_url(user, format: :json)