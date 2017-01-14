class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :destroy]
  # def index
  #   @blog = Blog.where(:id => params[:blog_id]).first
  #   @entries = @blog.entries.all
  # end
  def show
  end

  def new
    @blog = Blog.where(:id => params[:blog_id]).first
    @entry = @blog.entries.build
  end

  def create
    @blog = Blog.where(:id => params[:blog_id]).first
    @entry = @blog.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to [@blog, @entry] }
      else
        format.html { render :new }
      end
    end
  end
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html {redirect_to blog_url(:id => params[:blog_id])}
    end

  end
  private
    def set_entry
      @blog = Blog.where(:id => params[:blog_id]).first
      @entry = @blog.entries.find(params[:id])
    end
    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end