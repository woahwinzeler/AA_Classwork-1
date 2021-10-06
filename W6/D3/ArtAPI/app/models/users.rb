class User < ApplicationRecord
  validates :name, :email, :username, presence: true
  validates :email, :username, unique: true 

end 