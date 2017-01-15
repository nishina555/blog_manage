class CommentsController < ApplicationController
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
end