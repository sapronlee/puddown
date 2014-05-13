# encoding: utf-8

module Entities
  class EntityUser < Grape::Entity
    include Helpers
    
    expose :email
    
    with_options(format_with: :iso_time) do
      expose :created_at
      expose :updated_at
    end
  end
end