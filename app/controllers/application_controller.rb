class ApplicationController < ActionController::Base
  include ActionController::Cookies # 追加
  protect_from_forgery

  #ログインが必要なアクションは下記に追加する
  # before_action :require_login
  # before_action :check_xhr_header



  private
  def require_login
    @current_user = User.find_by(id: session[:user_id])
    return if @current_user

    render json: { error: 'unauthorized' }, status: :unauthorized
  end

  def check_xhr_header
    return if request.xhr?

    render json: { error: 'forbidden' }, status: :forbidden
  end

end
