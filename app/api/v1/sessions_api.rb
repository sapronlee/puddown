# encoding: utf-8

module V1
  module SessionsAPI
    extend ActiveSupport::Concern
    
    included do
      
      desc "用户登录"
      params do
        requires :email, type: String, desc: 'Email'
        requires :password, type: String, desc: 'Password'
      end
      post "login" do
        user = User.find_for_database_authentication(email: params[:email])
        if user && user.valid_password?(params[:password])
          user.ensure_authentication_token!
          return { access_token: user.authentication_token }
        end
        error!(I18n.t('devise.failure.invalid'), 401)
      end
      
      desc "用户退出"
      params do
        requires :access_token, type: String, desc: 'Access Token'
      end
      delete "logout" do
        authenticated!
        current_user.destroy_authentication_token!
        status 200
      end
      
    end
  end
end