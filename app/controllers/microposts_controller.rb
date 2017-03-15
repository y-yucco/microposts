class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]  #ログインしていないuserはloginページへ(ApplicationController)
    
    def create
      @micropost = current_user.microposts.build(micropost_params) #build = newに似ているが親要素への結びつき外部参照キーを自動でセット
      if @micropost.save                                           #パラメータを受け取って現在のユーザーに紐付いたMicropostのインスタンスを作成          
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
    end
    
    def destroy
      @micropost = current_user.microposts.find_by(id: params[:id])
      return redirect_to root_url if @micropost.nil?
      @micropost.destroy                                             #destroy=データベースから削除
      flash[:success] = "Micropos deleted"
      redirect_to request.referrer || root_url                      #referrer=該当ページに遷移する直前に閲覧されていた参照元url
    end                                                             #||　または　or　　　　
  
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end