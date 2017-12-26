class ForumMessagesController < ApplicationController
  def create
    @forum = Forum.find(params[:forum_id])
    x = params[:forum_message]
    @message = ForumMessage.new(user_id: x[:user_id], forum_id: params[:forum_id], title: x[:title], body: x[:body])
    if @message.save
      respond_to do |format|
        format.html { redirect_to forums_path(@forum) }
        format.js
      end
    end
  end

  private
  def message_params
    params.permit(:user_id, :forum_id, :title, :body)
  end
end
