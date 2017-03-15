class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  def logged_in_user
    unless logged_in?          #「unless」false場合(ログインしていない)の処理する
      store_location           #アクセスしているurlを保存
      flash[:dander] = "Please log in."
      redirect_to login_url    #ログイン画面のURLにリダイレク
    end
  end
end
