class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show 
  end
  
  def edit 
  end
  
  def update 
    if @user.update(user_params)
      flash[:success] = "編集しました"
      redirect_to user_path 
      else
        render 'edit'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
    else
      render'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :profile)
  end
  

  
  def set_user
    @user = User.find(params[:id])
  end
  
end