# app/models/student.rb
class Student < ApplicationRecord
  require "bcrypt"

  validates :email, presence: true, uniqueness: true

  # Method to set the password
  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end

  # Method to authenticate the password
  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
