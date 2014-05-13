# encoding: utf-8

class RootAPI < Grape::API
  use Middleware::Logger
  
  format :json
  default_format :json
  content_type :json, 'application/json; charset=utf-8'
  
  mount V1::Base
end