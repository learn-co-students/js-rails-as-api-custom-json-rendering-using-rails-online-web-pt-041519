class BirdsController < ApplicationController
  def index
    # While slice works fine for a single hash, as with bird, it won't work for an array of hashes like the one we have in our index action:
    birds = Bird.all

    # In this case, we can add in the only: option directly after listing an object we want to render to JSON:
    render json: birds, only: [:id, :name, :species]
  end

  def show
    # reminder: dont need to use instance variables anymore because we're immediately rendering birds and bird 
    # to JSON and are not using ERB
    bird = Bird.find_by(id: params[:id])
    if bird
    # we could  pick and choose what we want to render to the browser by creating a hash with the desired attributes
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # another option is using slice and passing it the attributes we're trying to render
      render json: bird.slice(:id, :name, :species)
    else 
      render json: {message: 'Bird not found'}
    end
  end

end