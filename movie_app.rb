require 'sinatra'
require 'mongo'
require 'pry'
require 'httparty'
require_relative 'movie'

get '/' do
  "Welcome to The Ultimate Movie Database & add instructions"
end

post '/film' do
  "What is the name of the film you want info on?"
  

  # Lookup the film information on the web

  film = Movie.get_film_info(params['name'])

  # store the film in the database

  # Display the movie in the page
 erb :movie_app, { :locals => { 
 	:movie_title => film.title,
 	:movie_year => film.year,
 	:movie_director => film.director,
 	:movie_plot => film.plot,
 	:movie_actors => film.actors,
 	}}
end