class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  def ensure_authentication_token!
    if authentication_token.blank?
      update_columns(
        authentication_token: generate_authentication_token,
        authentication_token_created_at: DateTime.now
      )
    end
  end
  
  def destroy_authentication_token!
    if authentication_token.present?
      update_columns(
        authentication_token: nil,
        authentication_token_created_at: nil
      )
    end
  end
  
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
  
end
