class CreateStudentTests < ActiveRecord::Migration[7.2]
  def change
    create_table :student_tests do |t|
      t.string :StudentName
      t.string :StudentClass

      t.timestamps
    end
  end
end
