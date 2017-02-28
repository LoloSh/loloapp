class Pet < ApplicationRecord
  belongs_to :user

  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :race, :presence => true, :length => { :in => 3..20 }
end
