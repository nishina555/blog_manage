class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  def approve
    params.permit(:status)
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(:status => params[:status])
        format.html { redirect_to blog_entry_url(:blog_id => params[:blog_id], :id => params[:entry_id])}
      else
        format.html { render blog_entry_url(:blog_id => params[:blog_id], :id => params[:entry_id])}
      end
    end
  end

  def create
    @entry = Entry.where(:id => params[:entry_id]).first
    @comment = @entry.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_entry_url(:blog_id => params[:blog_id], :id => params[:entry_id])}
      else
        format.html { render blog_entry_url(:blog_id => params[:blog_id], :id => params[:entry_id])}
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_url(:blog_id => params[:blog_id], :id => params[:entry_id])}
    end

  end

  private
    def set_comment
      @entry = Entry.where(:id => params[:entry_id]).first
      @comment = @entry.comments.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:body)
    end
end