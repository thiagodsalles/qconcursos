class QuestionSearchQuery
  def initialize(params)
    @params = params
  end

  def call
    if @params[:week] && @params[:year]
      search_by_week(@params[:week], @params[:year])

    elsif @params[:month] && @params[:year]
      search_by_month(@params[:month], @params[:year])

    elsif @params[:year]
      search_by_year(@params[:year])
    end
  end

  private

  def search_by_week(week, year)
    week_begin = Date.commercial(year.to_i, week.to_i, 1)
    week_end = Date.commercial(year.to_i, week.to_i, 7)

    query = QuestionAccess.where(date: week_begin..week_end)
    query_treatment(query)
  end

  def search_by_month(month, year)
    first_day = Date.new(year.to_i, month.to_i, 1)
    last_day = Date.new(year.to_i, month.to_i, -1)

    query = QuestionAccess.where(date: first_day..last_day)
    query_treatment(query)
  end

  def search_by_year(year)
    query = QuestionAccess.where(date: Date.parse("#{year}-01-01")..Date.parse("#{year}-12-31"))
    query_treatment(query)
  end

  def query_treatment(query)
    hash = query.group(:question_id).sum(:times_accessed).sort_by { |_,v| v }.reverse!.first(5)
    find_associated_questions(hash)
  end

  def find_associated_questions(hash)
    hash.map { |k,_| Question.find(k) }
  end
end
