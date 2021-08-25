class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by!(id: params[:id])
  end
end
