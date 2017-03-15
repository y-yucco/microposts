module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
   #||=は左の値がfalseかnilの場合にsession[:user_id]の値に一致するユーザーを左に代入
   
  def logged_in?
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
  #リクエストがもしGETの場合リクエストのURLをforwardingに保存しておく