class MatchesController < ApplicationController
  def index
    @title = 'Matches'
    @navbar_class = 'navbar-matches'
    @body_class = 'body-matches'
    @html_class = 'html-matches'
  end
end
