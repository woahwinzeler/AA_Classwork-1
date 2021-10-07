class Comment < ApplicationRecord

  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :user,
    dependent: :destroy

  belongs_to :artwork,
    dependent: :destroy


end
