class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  # def index
  #   @blog = Blog.where(:id => params[:blog_id]).first
  #   @entries = @blog.entries.all
  # end
  def show
    @comments = @entry.comments.all
  end

  def new
    @blog = Blog.where(:id => params[:blog_id]).first
    @entry = @blog.entries.build
  end

  def edit
  end

  def create
    @blog = Blog.where(:id => params[:blog_id]).first
    @entry = @blog.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        # format.html { redirect_to [@blog, @entry], notice: 'Entry was successfully created.' }
        format.html { redirect_to @blog, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to blog_url(:id => params[:blog_id]) , notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
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