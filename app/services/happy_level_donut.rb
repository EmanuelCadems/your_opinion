class HappyLevelDonut < Donut

private
  def query
    count_by('happy_level')
  end
end
