class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
    @user = User.find(@forum.user_id)
    @messages = @forum.forum_messages
    @message = ForumMessage.new(message_params)
  end

  private
  def message_params
    params.permit(:user_id, :forum_id, :title, :body)
  end
end
