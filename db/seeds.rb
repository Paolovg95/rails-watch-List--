require 'open-uri'
require 'json'

Movie.destroy_all

List::GENRES.each do |genre|
  list = List.create(
    name: genre
  )
end

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
