class Movie < ActiveRecord::Base
  def self.find_movies_same_director(dir) 
    return Movie.where(:director => dir)
  end
end
