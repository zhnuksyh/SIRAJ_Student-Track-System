# app/models/student.rb
class Student < ApplicationRecord
  has_many :merits, foreign_key: "StudentID"
  validates :email, presence: true, uniqueness: true

  # Method to set the password (plain text)
  def password=(new_password)
    self.password_digest = new_password
  end

  # Method to authenticate the password (plain text)
  def authenticate(password)
    self.password_digest == password
  end
end
