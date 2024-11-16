class ActorsController < ApplicationController
  def update
    #Get the params out of id
    act_id = params.fetch("the_id")
    #Look up the existing record
    matching_records = Actor.where({ :id => act_id })
    the_actor = matching_records.at(0)
    #Overwrite each column with the values from user inputs
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image")
    #Save the new inputs
    the_actor.save
    #Redirect
    redirect_to("/actors/#{the_actor.id}")
  end

  def create
    act = Actor.new
    act.name = params.fetch("the_name")
    act.dob = params.fetch("the_dob")
    act.bio = params.fetch("the_bio")
    act.image = params.fetch("the_image")
    
    act.save

    redirect_to("/actors")
  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Actor.where({ :id => the_id})
    the_actor = matching_records.at(0)
    the_actor.destroy
    
    redirect_to("/actors")
  end

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
