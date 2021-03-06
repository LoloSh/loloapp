require 'digest/sha1'


class User < ApplicationRecord
  #before_save :hashing_pw
  has_many :clients
  has_many :pets
  has_many :access_tokens, :through =>  :clients
  has_many :refresh_tokens, :through => :clients

  validates :firstname, :presence => true, :length => { :in => 3..20 }
  validates :surname, :presence => true, :length => { :in => 3..20 }
  validates :position, :presence => true, :length => { :in => 3..20 }


  validates :email, :presence => true, :length => { :in => 3..30 }, :uniqueness => true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates_length_of :hashpw, :in => 3..100, :on => :create
  validates_length_of :hashpw, :in => 3..100, :on => :update
  validates :hashpw, :confirmation => true #hashpw_confirmation attr








=begin
  def self.login_hash(email,password)
    hashpw=Digest::SHA1.hexdigest(password)

    user=User.find_by_email_and_hashpw(email,hashpw)

    return user
  end



  private
  def hashing_pw


    self.hashpw_confirmation=Digest::SHA1.hexdigest(self.hashpw_confirmation)
    self.hashpw = Digest::SHA1.hexdigest(self.hashpw )

  end
=end
end
