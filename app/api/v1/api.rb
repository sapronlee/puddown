# encoding: utf-8

module V1
  class API < Grape::API
    version 'v1', using: :path
  
    helpers V1::APIHelpers
  
    include V1::SessionsAPI
    include V1::UsersAPI
  end
end