require 'rails_helper'

RSpec.describe 'DateTransformService' do
  it 'week' do
    date_range = DateTransformService.week(3, 2010)
    expect(date_range.to_s).to eq('2010-01-18..2010-01-24')
  end

  it 'month' do
    date_range = DateTransformService.month(3, 2010)
    expect(date_range.to_s).to eq('2010-03-01..2010-03-31')
  end

  it 'year' do
    date_range = DateTransformService.year(2010)
    expect(date_range.to_s).to eq('2010-01-01..2010-12-31')
  end
end
