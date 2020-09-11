class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_tweet_in_header
  protected
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private 
    def after_sign_in_path_for(resource)
      root_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
      root_path # ログアウト後に遷移するpathを設定
    end

    def set_tweet_in_header
      @tweet_in_header = Tweet.new
    end
end
