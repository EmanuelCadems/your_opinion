class Donut
  def initialize(question)
    @question = question
  end

  def result
    ParseDonut.new(query).parse
  end

private
  def count_by(field)
    @question.answers.count(group: field, order: field)
  end
end

