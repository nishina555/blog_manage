class EntriesController < ApplicationController
  # def index
  #   @blog = Blog.where(:id => params[:blog_id]).first
  #   @entries = @blog.entries.all
  # end
  def new
    @blog = Blog.where(:id => params[:blog_id]).first
    @entry = @blog.entries.build
  end

  def create

  end
end