class RefreshToken < ApplicationRecord
  belongs_to :client
  belongs_to :user
end