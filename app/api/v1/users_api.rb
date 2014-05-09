# encoding: utf-8
require 'pry'

module V1
  module UsersAPI
    extend ActiveSupport::Concern
    included do
      
      namespace :users do
        
        after_validation do
          authenticated!
        end
        
        desc "通过ID获取用户信息"
        params do
          use :access_token
          requires :id, type: Integer, desc: 'ID'
        end
        get ":id" do
          user = User.find params[:id]
          present user, with: API::Entities::User
        end
        
      end
    end
  end
end