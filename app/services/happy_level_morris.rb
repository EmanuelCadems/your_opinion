class HappyLevelMorris < Morris

private
  def query
    count_by_date_and('happy_level')
  end

  def size_of_array
    1 + Answer::HAPPY_LEVEL.length
  end
end
