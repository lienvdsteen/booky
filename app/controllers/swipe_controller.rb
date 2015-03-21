class SwipeController < ApplicationController
  def index
    redirect_to_next_book
  end

  def show
    @page = 'swipe'
    @book = Book.find(params[:id])
    render action: :index
  end

  def like
    @user_swiped_rating = UserSwipedRating.create!(isbn: params[:id], user_id: current_user.id, rating: true)
    redirect_to_next_book
  end

  def dislike
    @user_swiped_rating = UserSwipedRating.create!(isbn: params[:id], user_id: current_user.id, rating: false)    
    redirect_to_next_book
  end

  private
  def redirect_to_next_book
    redirect_to swipe_path(Book.random)
  end
end
