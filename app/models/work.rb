class Work < ApplicationRecord
  self.primary_key = "date"
  belongs_to :user
end
