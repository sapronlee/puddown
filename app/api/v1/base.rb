# encoding: utf-8

module V1
  class Base < RootAPI
    version 'v1', using: :path
    
    mount UsersAPI
  end
end