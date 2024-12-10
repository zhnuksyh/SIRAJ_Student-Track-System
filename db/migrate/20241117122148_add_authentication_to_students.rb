class AddAuthenticationToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :email, :string
    add_index :students, :email, unique: true
    add_column :students, :password_digest, :string
  end
end
