class ArtworksController < ApplicationController
  def index
    render json: Artwork.all 
  end

  def show
    artwork = Artwork.find(params[:id])
    # if artwork
    render json: artwork 
    # else
    #   debugger
    #   artwork.errors.full_messages, status: :no_content 
    # end 
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      redirect_to artwork_url(artwork)
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    redirect_to artwork_url(artwork) #functional? 
  end

  def create
  end

  private

  def artwork_params 
    params.require(:artworks).permit(:artist_id, :title, :image_url)
  end
end
