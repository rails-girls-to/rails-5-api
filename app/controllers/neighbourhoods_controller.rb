class NeighbourhoodsController < ApplicationController
  before_action :set_neighbourhood, only: [:show, :update, :destroy]

  # GET /neighbourhoods
  def index
    @neighbourhoods = Neighbourhood.all

    render json: @neighbourhoods
  end

  # GET /neighbourhoods/1
  def show
    render json: @neighbourhood
  end

  # POST /neighbourhoods
  def create
    @neighbourhood = Neighbourhood.new(neighbourhood_params)

    if @neighbourhood.save
      render json: @neighbourhood, status: :created, location: @neighbourhood
    else
      render json: @neighbourhood.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /neighbourhoods/1
  def update
    if @neighbourhood.update(neighbourhood_params)
      render json: @neighbourhood
    else
      render json: @neighbourhood.errors, status: :unprocessable_entity
    end
  end

  # DELETE /neighbourhoods/1
  def destroy
    @neighbourhood.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighbourhood
      @neighbourhood = Neighbourhood.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def neighbourhood_params
      params.require(:neighbourhood).permit(:name, :num_businesses, :home_price)
    end
end
