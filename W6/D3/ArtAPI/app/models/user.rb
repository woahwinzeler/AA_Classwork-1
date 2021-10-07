class User < ApplicationRecord
  validates :name, :email, :username, presence: true
  validates_uniqueness_of :email, :username

  has_many :artworks,
    foreign_key: :artist_id
    

end 