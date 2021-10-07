class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: {scope: :viewer_id}

  #connects to both user and artwork 
  belongs_to :viewer, 
    foreign_key: :viewer_id,
    class_name: :User
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
  
  has_one :artist,
    through: :artwork, 
    source: :artist 
end