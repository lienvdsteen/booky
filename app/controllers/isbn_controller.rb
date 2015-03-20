class IsbnController < ApplicationController
  def show
    @isbn = params[:isbn]
    client = Openlibrary::Client.new
    keys = client.book_by_isbn(@isbn)
    olid = keys.first.values.first.split('/').last
    @book = client.book(olid)
  end

end
