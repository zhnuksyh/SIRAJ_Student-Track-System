class Merit < ApplicationRecord
  belongs_to :student
  self.primary_key = "meritID"
  # Add any associations, validations, or custom methods here
end
