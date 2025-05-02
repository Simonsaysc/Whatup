class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end
  def show
    @chat = Chat.find(params[:id])
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
      render :new, status: :unprocessable_entity # Re-render form with errors
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

  def load_users
    @users = User.all.order(:last_name, :first_name) # Get users for dropdown
  end
end
