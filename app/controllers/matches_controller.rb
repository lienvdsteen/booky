class MatchesController < ApplicationController
  layout false

  def index
    @title = 'Matches'
    @page = 'matches'

    client = Openlibrary::Client.new

    @matches = ['0345803485', '0345803485', '0345803485']
    @matches.map! do | match |
      keys = client.book_by_isbn(match)
      olid = keys.first.values.first.split('/').last
      client.book(olid)
    end
  end
end
