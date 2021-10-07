# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist1 = User.create(name: "artist1", email: "artist1@email", username:"greatness")
artwork1 = Artwork.create(title: "best", artist_id: 1, image_url: "artist.com")
shared_first1 = ArtworkShare.create(artwork_id: 2, viewer_id: 1)