# class
class BlogsController < ApplicationController
  before_action :set_entry, only: [:show]

  # GET /blogs
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  def show
  end

  # GET /blog/new
  def new
    @blog = Blog.new
  end

  # def edit
  #
  # end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)


    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog}
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /entries/1
  # def destroy
  #
  # end

  private
    def set_entry
      @blog = Blog.find(params[:id])
    end
    def blog_params
      params.require(:blog).permit(:title)
    end
end
