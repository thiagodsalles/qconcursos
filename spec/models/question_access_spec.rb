require 'rails_helper'

RSpec.describe QuestionAccess, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:question) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:times_accessed) }
    it { is_expected.to validate_numericality_of(:times_accessed) }
  end
end
