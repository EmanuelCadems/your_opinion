class ScaleDonut < Donut

private
  def query
    sum_scale
  end

  def sum_scale
    {:total => @question.answers.sum(:scale)}
  end
end
