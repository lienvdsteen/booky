class MatchesController < ApplicationController
  layout false

  def index
    @title = 'Matches'
    @page = 'matches'
  end
end
