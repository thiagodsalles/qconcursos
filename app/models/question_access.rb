class QuestionAccess < ApplicationRecord
  belongs_to :question

  validates :date, :times_accessed, presence: true
  validates :times_accessed, numericality: { only_integer: true }
end
