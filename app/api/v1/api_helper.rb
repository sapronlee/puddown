# encoding: utf-8

module V1
  module APIHelper
    
    def warden
      env['warden']
    end
    
    def authenticated?
      return true if warden.authenticated?
      params[:access_token] && @user = User.find_by(authentication_token: params[:access_token])
    end
    
    def authenticated!
      error!(I18n.t('devise.failure.unauthenticated'), 401) unless authenticated?
    end
    
    def current_user
      warden.user || @user
    end
    
  end
end