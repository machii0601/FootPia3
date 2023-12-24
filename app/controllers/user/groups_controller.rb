class User::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @post_comment = PostComment.new
    @groups = Group.all
    @user = User.find(current_user.id)
  end

  def show
    @post_comment = PostComment.new
    @group = Group.find(params[:id])
    @user = User.find(params[:id])
    unless @group.is_join?(current_user)
      redirect_to groups_path, notice: "詳細を見るにはグループにjoinしてください"
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path, method: :post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def join
    group = Group.find(params[:group_id])
    group.group_users.find_or_create_by(user_id: current_user.id)
    redirect_to groups_path
  end

  def withdrawal
    group = Group.find(params[:group_id])
    group.group_users.find_by(user_id: current_user.id).destroy()
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :description)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end