# script/update_passwords.rb
Student.find_each do |student|
  if student.password_digest.present?
    student.password_digest = 'default_password' # Set a default password or generate a new one
    student.save!
  end
end
