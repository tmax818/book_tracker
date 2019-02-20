class UsersController < ApplicationController

  def index
    debugger
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Reader's Library"
      redirect_to @user
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def auth
      request.env['omniauth.auth']
    end
end
