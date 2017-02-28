class Client < ApplicationRecord
  belongs_to :user
  has_one :access_tokens
  has_one :refresh_token
end