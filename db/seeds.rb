# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Project.create(title: "Project 1", description: "Description 1", image_url: "https://cdn2.unrealengine.com/ue-logo-1400x788-1400x788-8f185e1e3635.jpg", user_id: 1)
