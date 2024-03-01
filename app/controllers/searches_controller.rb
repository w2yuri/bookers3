class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "user"
      @records = User.search(@content)
    else
      @records = Book.search(@content)
    end
  end 
end 