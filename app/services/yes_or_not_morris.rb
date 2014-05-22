class YesOrNotMorris < Morris

private
  def query
    count_by_date_and('yes_or_not')
  end

  def size_of_array
    1 + Answer::YES_OR_NOT.length
  end
end
