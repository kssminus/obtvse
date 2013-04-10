class PostsController < ApplicationController
  before_action :authenticate, :except => [:index, :show]
  before_action :categorize, :except => [:admin]
  layout :choose_layout

  def index
    @posts = Post.page(params[:page]).per(10).where(draft:false)

    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
      format.rss { render :layout => false }
    end
  end

  def preview
    @post = Post.new(post_params)
    @preview = true

    respond_to do |format|
      format.html { render 'show' }
    end
  end

  def admin
    @no_header = true
    @post = Post.new
    @published = Post.where(draft:false).page(params[:post_page]).per(20)
    @drafts = Post.where(draft:true).page(params[:draft_page]).per(20)

    respond_to do |format|
      format.html
    end
  end

  def show
    @single_post = true
    @post = admin? ? Post.find_by_slug(params[:slug]) : Post.find_by(slug: params[:slug], draft: false)

    respond_to do |format|
      if @post.present?
        @category = @post.category
        format.html
        format.xml { render :xml => @post }
      else
        format.any { head status: :not_found  }
      end
    end
  end

  def new
    @no_header = true
    @posts = Post.page(params[:page]).per(20)
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml { render xml: @post }
    end
  end

  def edit
    @no_header = true
    @post = Post.find(params[:id])
    @category = @post.category 
  end

  def create
    @category = Category.find_or_create_by(category_params)
    @post = @category.post.build(post_params)
    
    respond_to do |format|
      if(@category.save && @post.save)
        format.html { redirect_to "/edit/#{@post.id}", :notice => "Post created successfully" }
        format.xml { render :xml => @post, :status => :created, location: @post }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    @post = Post.find(post_params[:id])
    @category = Category.find_or_create_by(category_params)

    respond_to do |format| 
      if @category.save
        @post.category_id = @category.id
        @post.update(post_params)
        format.html { redirect_to "/edit/#{@post.id}", :notice => "Post updated successfully" }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/admin' }
      format.xml { head :ok }
    end
  end

  private

  def admin?
    session[:admin] == true
  end

  def choose_layout
    if ['admin', 'new', 'edit', 'create'].include? action_name
      'admin'
    else
      'application'
    end
  end

  def post_params
     params[:post][:slug] = params[:post][:title].to_url if params[:post][:slug].eql? ""
     params.require(:post).permit(:id, :title, :content, :slug, :url, :draft)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
