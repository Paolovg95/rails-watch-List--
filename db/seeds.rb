# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"
response = URI.open("#{url}?page=#{1}")
movies = JSON.parse(response.read)['results']
image_url = "https://image.tmdb.org/t/p/w500"

movies.each do |movie|
  movie = Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "#{image_url}/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

20.times do
  list = List.create(
    name: List::GENRES.sample
  )
end
