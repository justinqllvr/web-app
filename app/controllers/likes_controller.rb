class LikesController < ApplicationController  
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @like = Like.create(report_id: params[:report_id], user_id: current_user.id)
    end
    redirect_to report_path(@like.report)
  end


  def destroy
    if already_liked?
      @like = Like.where(user_id: current_user.id, report_id: params[:report_id]).first
      @report = @like.report
      @like.destroy
    else
      flash[:notice] = "Cannot unlike"
    end
    redirect_to report_path(@report)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, report_id:
    params[:report_id]).exists?
  end
end
