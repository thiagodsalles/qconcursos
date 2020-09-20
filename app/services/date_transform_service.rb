class DateTransformService
  def self.week(week, year)
    week_begin = Date.commercial(year.to_i, week.to_i, 1)
    week_end = Date.commercial(year.to_i, week.to_i, 7)

    week_begin..week_end
  end

  def self.month(month, year)
    first_day = Date.new(year.to_i, month.to_i, 1)
    last_day = Date.new(year.to_i, month.to_i, -1)

    first_day..last_day
  end

  def self.year(year)
    Date.parse("#{year}-01-01")..Date.parse("#{year}-12-31")
  end
end
