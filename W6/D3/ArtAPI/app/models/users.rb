class User < ApplicationRecord
  validates :name, :email, :username, presence: true
  validates :email, :username, unique: true 

  has_many :artworks,
    foreign_key: :artist_id
    

end 