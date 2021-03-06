class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.where('user_id != ?', current_user.id).update(read: true)
      end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.js
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :read)
  end
end
