class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.timestamps
    end
  end
end
