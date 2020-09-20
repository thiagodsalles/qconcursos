class Question < ApplicationRecord
  has_many :question_accesses

  validates :statement, :text, :answer, :daily_access, :discipline, :created_at, presence: true
  validates :daily_access, numericality: { only_integer: true }
end
