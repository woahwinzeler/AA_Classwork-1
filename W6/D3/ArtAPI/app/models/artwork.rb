class Artwork < ApplicationRecord

  validates :title, :artist_id, :image_url, presence: true
  validates :artist_id, uniqueness: {scope: :title}
  # unique_hash = (:artist_id.hash + title.hash).hash

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

end
