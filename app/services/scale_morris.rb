class ScaleMorris < Morris

  def result
    ParseScale.new(query).parse
  end

private
  def query
    sum_scale_by_date
  end

  def sum_scale_by_date
    @question.answers.select('sum(scale) as total, date(created_at) as date_created_at').group('date(created_at)').order('date(created_at)')
  end
end
