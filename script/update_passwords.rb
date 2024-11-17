# script/update_passwords.rb
require 'bcrypt'

Student.find_each do |student|
  if student.password_digest.present? && !BCrypt::Password.valid_hash?(student.password_digest)
    student.password = 'default_password' # Set a default password or generate a new one
    student.save!
  end
end
