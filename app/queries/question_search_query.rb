class QuestionSearchQuery
  def initialize(params)
    @params = params
  end

  def call
    if @params[:week]
      search_by_week(@params[:week], @params[:year])

    elsif @params[:month]
      search_by_month(@params[:month], @params[:year])

    elsif @params[:year]
      search_by_year(@params[:year])
    end
  end

  private

  def search_by_week(week, year)
    date = DateTransformService.week(week, year)
    query(date)
  end

  def search_by_month(month, year)
    date = DateTransformService.month(month, year)
    query(date)
  end

  def search_by_year(year)
    date = DateTransformService.year(year)
    query(date)
  end

  def query(date)
    hash = QuestionAccess.where(date: date)
                         .group(:question_id)
                         .sum(:times_accessed)
                         .sort_by { |_, v| v }
                         .reverse!
                         .first(quantity)

    find_associated_questions(hash)
  end

  def quantity
    @params[:quantity] ? @params[:quantity].to_i : 3
  end

  def find_associated_questions(hash)
    hash.map { |k, _| Question.find(k) }
  end
end
