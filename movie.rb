class Movie

  # Add attr_accessors for the values you want to store...
attr_accessor :title
attr_accessor :year
attr_accessor :director
attr_accessor :plot
attr_accessor :actors

  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    binding.pry

    # Create a Movie object...
    m = Movie.new

    # Fill in the attributes...

    m.title = movie_info["Title"]
    m.year = movie_info["Year"]
    m.director = movie_info["Director"]
    m.plot = movie_info["Plot"]
    m.actors = movie_info["Actors"]
    return m
    binding.pry
  end

end