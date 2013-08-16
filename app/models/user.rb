class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates :name, uniqueness: true, presence: true
  validates :password, length: { minimum: 3, allow_nil: true }
  
  def create_session_token
    token = SecureRandom.urlsafe_base64
    self.session_token = token
    self.save!
    token
  end
  
end
