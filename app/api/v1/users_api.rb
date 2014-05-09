# encoding: utf-8
require 'pry'

module V1
  module UsersAPI
    extend ActiveSupport::Concern
    included do
      
      resource :users do
        
        desc "通过ID获取用户信息"
        params do
          requires :id, type: Integer, desc: 'ID'
        end
        get ":id" do
        end
        
        desc "用户登录"
        params do
          requires :email, type: String, desc: 'Email'
          requires :password, type: String, desc: 'Password'
        end
        post "login" do
          user = User.find_for_database_authentication(email: params[:email])
          return { access_token: user.authentication_token } if user && user.valid_password?(params[:password])
          error!(I18n.t('devise.failure.invalid'), 401)
        end
        
        desc "用户退出"
        params do
          requires :token, type: String, desc: 'Token'
        end
        delete "logout" do
        end
        
      end
    end
  end
end