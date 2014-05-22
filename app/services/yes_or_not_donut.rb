class YesOrNotDonut < Donut

private
  def query
    count_by('yes_or_not')
  end
end
