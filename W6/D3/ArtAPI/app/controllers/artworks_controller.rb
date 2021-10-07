class ArtworksController < ApplicationController
  def index
    render json: Artwork.all 
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork 
    else
      artwork.erros.full_messages, status: :no_content 
    end 
  end

  def update
    artwork = Artwork.update(artworks_params)
    if artwork 
      redirect_to artwork_url(show)
    else
      artwork.erros.full_messages, status: :not_modified
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      redirect_to artwork_url(show) #functional? 
    else
      artwork.erros.full_messages, status: :not_modified
    end
  end

  def create
  end

  private

  def artworks_params 
    params.requrie(:artworks).permit(:artist_id, :title, :image_url)
  end
end
