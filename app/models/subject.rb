class Subject < ApplicationRecord
  belongs_to :student, foreign_key: "StudentID"
  self.primary_key = "SubjectID"

  before_create :generate_subject_id

  private

  def generate_subject_id
    self.SubjectID = SecureRandom.uuid if self.SubjectID.blank?
  end
end
