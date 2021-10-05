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
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)

  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    select movies.title
    from castings
    join actors on actors.id = castings.actor_id
    join movies on movies.id = castings.movie_id
    where actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
    select movies.title
    from castings
    join movies on movies.id = castings.movie_id
    join actors on actors.id = castings.actor_id
    where name = 'Harrison Ford'
    and ord != 1

  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    select movies.title, actors.name
    from castings
    join movies on movies.id = castings.movie_id
    join actors on actors.id = castings.actor_id
    where yr = 1962
    and ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    select yr, count(title)
    from castings
    join actors on actors.id = castings.actor_id
    join movies on movies.id = castings.movie_id
    where actors.name = 'John Travolta'
    group by movies.yr
    having count(title) >= 2

  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
  SELECT
  DISTINCT movies.title,
  actors.name
FROM
  movies
JOIN
  castings ON castings.movie_id = movies.id
JOIN
  actors ON actors.id = castings.actor_id
WHERE
  movies.id IN (
    SELECT
      movies.id
    FROM
      movies
    JOIN
      castings ON castings.movie_id = movies.id
    JOIN
      actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'Julie Andrews'
  ) AND castings.ord = 1
ORDER BY
  movies.title;
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
  SELECT
  actors.name
FROM
  actors
JOIN
  castings ON castings.actor_id = actors.id
WHERE
  castings.ord = 1
GROUP BY
  actors.name
HAVING
  COUNT(*) >= 15
  order by name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SQL
end
