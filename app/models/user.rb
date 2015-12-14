class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password
  enum role: [:manager, :admin]

  def remember
    self.remember_token = User.new_token
    update_attributes! remember_digest: User.digest(remember_token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
