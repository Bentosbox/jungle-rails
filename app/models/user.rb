class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  # validates :password, presence: true, length: {minimum: 4}
  # validates :password_confirmation, presence: true


end
