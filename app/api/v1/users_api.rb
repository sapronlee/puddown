# encoding: utf-8

module V1
  class UsersAPI < Base
    namespace :users do
      
      guard_all!
      
      desc "根据ID获取用户信息"
      params do
        requires :id, type: Integer, desc: 'ID'
      end
      get ":id" do
        user = User.find params[:id]
        present user, with: Entities::EntityUser
      end
    end
  end
end