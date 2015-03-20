class IsbnController < ApplicationController
  def show
    @isbn = params[:isbn]
  end
end
