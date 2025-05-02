class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end
  before_action :load_chats_and_users, only: [ :new, :create ]
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      # Redirect to the chat show page (if you have one) or messages index
      redirect_to messages_path, notice: "Message sent successfully."
      # Or maybe: redirect_to chat_path(@message.chat), notice: "Message sent."
    else
      render :new, status: :unprocessable_entity # Re-render form with errors
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end

  def load_chats_and_users
    @chats = Chat.includes(:sender, :receiver).all # Eager load for display_name
    @users = User.all.order(:last_name, :first_name)
  end
end
