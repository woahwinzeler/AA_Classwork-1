class User < ApplicationRecord
  validates :name, :email, :username, presence: true
  validates_uniqueness_of :email, :username

  has_many :artworks,
    foreign_key: :artist_id,
    depedent: :destroy
    
  has_many :shared_artworks,
    through: :artworks,
    source: :artwork_share,
    depedent: :destroy
end 