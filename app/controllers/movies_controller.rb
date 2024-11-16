class MoviesController < ApplicationController
  def create
    # params look like this:
    #{"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"7", "controller"=>"movies", "action"=>"create"}
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
    
    m.save

    redirect_to("/movies")
    #Retreive user inputs from params
    #Create a record in the movie table
    #Populate each column with user input
    #Save

    #Redirect user to movies URL
  end
  
  def destroy
    the_id = params.fetch("an_id")
    matching_records = Movie.where({ :id => the_id})
    the_movie = matching_records.at(0)
    the_movie.destroy
    
  end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
