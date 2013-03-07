class CategoriesController < ApplicationController

  def index
    objs = Category.all()
    
    @categories = objs.map {|c| c.name }

    respond_to do |format|
      format.html
      format.json { render :json => @categories }
    end
  end

end
