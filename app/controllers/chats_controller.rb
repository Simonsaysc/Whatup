# app/controllers/chats_controller.rb
class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.for_user(current_user)
  end
  def show
    unless @chat
      Rails.logger.error "ChatsController#show: @chat is nil for params: #{params.inspect}"
      @messages = []
    else
      @messages = @chat.messages.order(created_at: :asc)
    end

    @new_message = @chat ? @chat.messages.build : Message.new
  end

  def new
    @users = User.where.not(id: current_user.id).order(:first_name, :last_name)
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.sender = current_user

    if @chat.save
      redirect_to chats_path, notice: "Chat was successfully started."
    else
      @users = User.where.not(id: current_user.id).order(:first_name, :last_name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.where.not(id: current_user.id).order(:first_name, :last_name)
  end

  def update
    if @chat.update(chat_params_for_update)
      redirect_to chats_path, notice: "Chat was successfully updated."
    else
      @users = User.where.not(id: current_user.id).order(:first_name, :last_name)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end
