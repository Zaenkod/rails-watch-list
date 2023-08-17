class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[new create]

  def new
    @bookmark = Bookmark.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    
  end
  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :rating)
  end
end
