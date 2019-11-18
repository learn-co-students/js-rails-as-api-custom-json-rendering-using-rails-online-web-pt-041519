class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # SAME AS: 
    # render json: bird.to_json(only: [:id, :name, :species])
    # Ruby magic obscures that 'only' and 'except' are simply params of to_json
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, except: [:created_at, :updated_at]
    else
      render json: {message: 'Bird not found'}
    end
  end
end