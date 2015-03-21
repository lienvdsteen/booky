class MatchesController < ApplicationController
  layout false

  def index
    @title = 'Matches'
    @page = 'matches'

    @matches = current_user.get_likes.map(&:book)
  end
end
