class SearchesController < ApplicationController

  def search
    @model = params[:model]
    if @model  == "User"
      @users = User.looks(params[:method], params[:content])
    elsif
      @books = Book.looks(params[:method], params[:content])
    elsif
      @groups = Group.looks(params[:method], params[:content])
    end
    
  end
end
