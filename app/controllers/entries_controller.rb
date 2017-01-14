class EntriesController < ApplicationController
  def index
    @blog = Blog.where(:id => params[:blog_id]).first
    @entries = @blog.entries.all
  end
end