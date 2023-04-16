class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params) #Not the final implemntation
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to users_path
    else
      puts @user.errors.full_messages
      render :new, status: :unprocessable_entity, content_type: "text/html"
    end
  end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
