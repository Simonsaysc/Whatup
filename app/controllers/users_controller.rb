class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]
  def index
    @users = User.all
  end
  def show
    @user_chats = @user.all_chats.includes(:sender, :receiver, :messages).order(updated_at: :desc)
    @user_messages = @user.messages.includes(:chat).order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User #{@user.email} created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
