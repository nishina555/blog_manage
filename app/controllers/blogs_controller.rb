# class
class BlogsController < ApplicationController
  before_action :set_entry, only: [:show]
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  private
    def set_entry
      @blog = Blog.find(params[:id])
    end
end
