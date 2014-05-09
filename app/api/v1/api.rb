# encoding: utf-8

module V1
  class API < Grape::API
    version 'v1', using: :path
  
    helpers V1::APIHelper
    
    before do
      authenticated! unless route.to_s.include?("login")
    end
  
    include V1::UsersAPI
  end
end