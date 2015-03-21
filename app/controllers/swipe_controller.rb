class SwipeController < ApplicationController
  def index
    redirect_to_next_book
  end

  def show
    @page = 'swipe'
    set_book
    render action: :index
  end

  def like
    set_book
    @user_swiped_rating = current_user.user_swiped_ratings.create!(book: @book, rating: true)
    redirect_to_next_book
  end

  def dislike
    set_book
    @user_swiped_rating = current_user.user_swiped_ratings.create!(book: @book, rating: false)
    redirect_to_next_book
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def redirect_to_next_book
    redirect_to swipe_path(Book.random)
  end
end
