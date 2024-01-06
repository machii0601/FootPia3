class User::GroupCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = GroupComment.new(group_comment_params)
    if @comment.save!
      redirect_to group_path(params[:group_id])
    else
      @user = current_user
      render "user/groups/show"
    end
  end

  def destroy
    GroupComment.destroy(params[:id])
    redirect_to group_path(params[:group_id])
  end

  private

  def group_comment_params
    params.require(:group_comment).permit(:comment)
                                  .merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
