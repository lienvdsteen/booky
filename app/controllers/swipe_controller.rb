class SwipeController < ApplicationController
  def index
    @page = 'swipe'
    @isbn = '0345803485'
    client = Openlibrary::Client.new
    keys = client.book_by_isbn(@isbn)
    olid = keys.first.values.first.split('/').last
    @book = client.book(olid)
  end
end
