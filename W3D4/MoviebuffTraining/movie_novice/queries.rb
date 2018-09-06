# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  Actor.find_by_name("Angelina Jolie") 

end

def top_titles

  movies = Movie.all
  selected = movies.select{|datum| datum[:score] > 8.9}
  selected.map{|datum| {"id" => datum.id , "title" => datum.title} }

end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  movies = Movie.all
  a= movies.select{|datum| datum[:title].include?("Star Wars")}
  a.map{|datum| {"id" => datum.id , "title" => datum.title, "yr" => datum.yr} }

end


def below_average_years
  Movie
  .select('yr', 'COUNT(*) as bad_movies')
  .where('score < 5')
  .group('yr')
  .order('bad_movies DESC')

end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!
  Actor
    .order('name ASC')
    .limit(10)

end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  Actor
    .select(:id, :name)
    .joins(:movies)
    .where('title = \'Pulp Fiction\'')
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Movie
    .select(:id, :title, :yr)
    .joins(:actors)
    .where('name = \'Uma Thurman\'')
    .order('yr ASC')
end
