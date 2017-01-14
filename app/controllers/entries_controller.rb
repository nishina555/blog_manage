class EntriesController < ApplicationController
  before_action :set_entry, only: [:show]
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
  private
    def set_entry
      @blog = Blog.where(:id => params[:blog_id]).first
      @entry = @blog.entries.find(params[:id])
    end
    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end