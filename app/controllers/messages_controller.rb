class MessagesController < ApplicationController
  before_action :set_message, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @messages = Message.all
  end
  def show
  end
  before_action :load_chats_and_users, only: [ :new, :create, :update, :edit ]
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Message sent successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @message.update(message_params)
      redirect_to messages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end

  def load_chats_and_users
    @chats = Chat.includes(:sender, :receiver).all
    @users = User.all.order(:last_name, :first_name)
  end
end
