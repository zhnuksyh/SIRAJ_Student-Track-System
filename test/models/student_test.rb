require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # app/models/student.rb
  class Student < ApplicationRecord
    self.table_name = "Student"
    self.primary_key = "StudentID"
  end
end
