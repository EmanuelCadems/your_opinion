class Statistic
  def initialize(question)
    @question = question
  end

  def morris
    yes_or_not = happy_level = -> { ParseMorris.new(query).parse(size_of_array) }
    scale                    = -> { ParseScale.new(query).parse }

    @question.case_answer(happy_level, yes_or_not, scale)
  end

  def donut
    ParseDonut.new(query_donut).parse
  end

private

  def query
    happy_level = -> { count_by_date_and('happy_level') }
    yes_or_not  = -> { count_by_date_and('yes_or_not')  }
    scale       = -> { sum_scale_by_date  }
    @question.case_answer(happy_level, yes_or_not, scale)
  end

  def query_donut
    happy_level = -> { count_by('happy_level') }
    yes_or_not  = -> { count_by('yes_or_not') }
    scale       = -> { sum_scale }
    @question.case_answer(happy_level, yes_or_not, scale)
  end

  def count_by_date_and(field)
    @question.answers.group("#{field}, date(created_at)").order('date(created_at)').count(group: field)
  end

  def count_by(field)
    @question.answers.count(group: field, order: field)
  end

  def sum_scale_by_date
    @question.answers.select('sum(scale) as total, date(created_at) as date_created_at').group('date(created_at)').order('date(created_at)')
  end

  def sum_scale
    {:total => @question.answers.sum(:scale)}
  end

  def size_of_array
    happy_level = -> { Answer::HAPPY_LEVEL.length }
    yes_or_not  = -> { Answer::YES_OR_NOT.length }
    scale       = -> { 2 }
    1 + @question.case_answer(happy_level, yes_or_not, scale)
  end
end
