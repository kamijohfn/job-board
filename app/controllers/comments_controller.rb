class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to job_path(@comment.job)
    
    else
      @job = @comment.job
      @comments = @job.comments
      render "jobs/show"
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:text, :think_id).merge(user_id: current_user.id, job_id: params[:job_id])
  end

end
