json.clients @clients do |client|
  json.oauth_id client.oauth_id
  json.oauth_secret client.oauth_secret
  json.oauth_name client.oauth_name
end
