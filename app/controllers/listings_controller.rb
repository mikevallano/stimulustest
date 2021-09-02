class ListingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @listing = Listing.new(listing_params.merge(creator_id: current_user.id))
    @listing.save
    redirect_to movie_path(@listing.movie)
  end

  def destroy
    @listing = Listing.find_by(id: params[:id])
    @listing.destroy
    redirect_to movie_path(@listing.movie)
  end

  private

  def listing_params
    params.require(:listing).permit(:list_id, :movie_id, :creator_id)
  end
end
