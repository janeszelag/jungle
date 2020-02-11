class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}, allow_nil: false
  validates :password_confirmation, presence: true
  validates :password, length: { in: 6..20 }
  validates :password, confirmation: { case_sensitive: false }

  # def self.authenticate_with_credentials(email, password)
  #   email = email.strip
  #   user = User.find_by_email(email.downcase)
  #   if (user && user.authenticate(password))
  #     user
  #   else 
  #     nil
  #   end
  # end

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("lower(email) = ?", email.downcase).first
    if (user && user.authenticate(password))
      return user
    end
    nil
  end
end


