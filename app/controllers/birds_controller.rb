class BirdsController < ApplicationController
  
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:updated_at, :created_at] #alt to above
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species) #---- same result a above
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

end
