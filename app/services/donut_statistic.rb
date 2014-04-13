class DonutStatistic
  def initialize(question)
    @question = question
  end

  def donut
    ParseDonut.new(query_donut).parse
  end

private
  def query_donut
    happy_level = -> { count_by('happy_level') }
    yes_or_not  = -> { count_by('yes_or_not') }
    scale       = -> { sum_scale }
    @question.case_answer(happy_level, yes_or_not, scale)
  end

  def count_by(field)
    @question.answers.count(group: field, order: field)
  end

  def sum_scale
    {:total => @question.answers.sum(:scale)}
  end
end
