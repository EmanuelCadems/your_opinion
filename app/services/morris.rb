class Morris
  def initialize(question)
    @question = question
  end

  def result
    ParseMorris.new(query).parse(size_of_array)
  end

protected
  def count_by_date_and(field)
    @question.answers.group("#{field}, date(created_at)").order('date(created_at)').count(group: field)
  end
end
