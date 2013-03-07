class CategoriesController < ApplicationController

  def index
    @categories = Category.all()
    
    category_names = @categories.map {|c| c.name }

    respond_to do |format|
      format.json { render :json => category_names }
    end
  end

  def list
    @category = Category.find_by_name(params[:category])
    @posts = @category.post.page(params[:page]).per(10).where(draft:false)
    
    respond_to do |format|
      format.html { render :template => 'posts/index' }
    end

  end
end
