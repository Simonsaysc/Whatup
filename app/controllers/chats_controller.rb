class ChatsController < ApplicationController
  before_action :set_chat, only: [ :show, :edit, :update ]
  def index
    @chats = Chat.all
  end
  def show
  end
  before_action :load_users, only: [ :new, :create ]
  def new
    @chat = Chat.new
  end
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path, notice: "Chat between #{@chat.sender.display_name} and #{@chat.receiver.display_name} created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @chat.update(chat_params)
      redirect_to chats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

  def load_users
    @users = User.all.order(:last_name, :first_name)
  end
end
