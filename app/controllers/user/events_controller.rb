class User::EventsController < ApplicationController
  def index; end

  def calendar_json
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to group_path(params[:group_id])
    else
      @user = current_user
      @group = Group.find(params[:group_id])
      render "user/groups/show"
    end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to group_path(params[:group_id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
                          .merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
