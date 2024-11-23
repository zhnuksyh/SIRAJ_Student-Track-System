# app/models/merit.rb
class Merit < ApplicationRecord
  belongs_to :student, foreign_key: "StudentID"
  self.primary_key = "meritID"

  before_create :generate_merit_id

  private

  def generate_merit_id
    self.meritID = SecureRandom.uuid if self.meritID.blank?
  end
end
