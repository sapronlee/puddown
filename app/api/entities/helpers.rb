module Entities
  module Helpers
    extend ActiveSupport::Concern
    
    included do
      # formats
      format_with :iso_time do |time|
        time.iso8601 if time.present?
      end
      
      # common exposes
      expose :id
    end
    
  end
end