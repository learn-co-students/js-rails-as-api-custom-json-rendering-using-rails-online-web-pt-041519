class BirdsController < ApplicationController

  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species]
    # the line above could also be expressed as:
    # render json: birds, except: [:created_at, :updated_at]
    # This is the explicit version of the above statements
    # render json: birds.to_json(except: [:created_at, :updated_at]) 
    # Explicit version using the "only:" .
    # render json: birds.to_json(only: [:id, :name, :species])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # the line above is the same as the line below. 
    
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
    
  end

end