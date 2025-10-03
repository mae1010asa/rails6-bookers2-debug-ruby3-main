class SearchesController < ApplicationController

  def search
    @model = params[:model]
    if @model  == "User"
      @users = User.looks(params[:method], params[:content])
    else
      @books = Book.looks(params[:method], params[:content])
    end
    
  end
end
