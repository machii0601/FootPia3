class User::ActivitiesController < ApplicationController
  def index
    @activities = current_user.activities.order(created_at: :desc).page(params[:page]).per(20)
  end
  def read
    activity =  Activity.find(params[:id])
    unless activity.read?
      activity.update(read: true)
    end
    case activity.action_type
    when "post_comment"
      redirect_to post_path(activity.subject.post)
    when "favorite"
      redirect_to post_path(activity.subject.post)
    when "follow"
      redirect_to user_path(activity.subject)
    end
  end

  def transition_path(activity)#アクションタイプごとにリダイレクト先を指定
    case activity.action_type
    when 'favorite'
      user_diary_path(activity.subject.diary.user.name_id,activity.subject.diary.id)
    when 'post_comment'
      user_diary_path(activity.subject.diary.user.name_id,activity.subject.diary.id)
    when 'follow'
      user_path(activity.subject.follower.name_id)
    end
  end
end
