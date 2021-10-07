class Artwork < ApplicationRecord

  validates :title, :artist_id, :image_url, presence: true
  validates :artist_id, uniqueness: {scope: :title}
  # unique_hash = (:artist_id.hash + title.hash).hash

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User,
    depedent: :destroy 

  has_many :artwork_share,
    foreign_key: :artwork_id,
    class_name: "ArtworkShare"
    

  has_many :shared_viewers,
    through: :artwork_share,
    source: :viewer
end
