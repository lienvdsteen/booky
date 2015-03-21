class SwipeController < ApplicationController
  def index
    @page = 'swipe'
    @isbn = '0345803485'
    client = Openlibrary::Client.new
    keys = client.book_by_isbn(@isbn)
    olid = keys.first.values.first.split('/').last
    @book = client.book(olid)
  end

  def show
  end

  def like
    @user_swiped_rating = UserSwipedRating.create!(isbn: params[:id], user_id: @current_user.id, rating: true)
  end

  def dislike
    @user_swiped_rating = UserSwipedRating.create!(isbn: params[:id], user_id: @current_user.id, rating: false)    
  end
end
