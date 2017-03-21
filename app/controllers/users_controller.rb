class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc) #oder取得した値を並び替え desc降順
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
  
  def followings
    @user  = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_users
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :profile)
  end
  

  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    if @user != current_user
      redirect_to root_url
    end
  end
end