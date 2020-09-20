module Api
  module V1
    class DisciplinesController < ApplicationController

      def index
        max_daily_access = Question.maximum(:daily_access)
        disciplines = Question.where(daily_access: max_daily_access).pluck(:discipline).uniq

        render json: disciplines, status: :ok
      end
    end
  end
end
