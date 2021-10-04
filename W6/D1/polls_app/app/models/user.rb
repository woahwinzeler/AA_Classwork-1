class User < ApplicationRecord

  has_many :authored_polls,
    class_name: 'Poll',
    primary_key: :id,
    foreign_key: :author_id,
    optional: true

  has_many :responses,
    class_name: 'Response',
    primary_key: :id,
    foreign_key: :user_id,
    optional: true

end