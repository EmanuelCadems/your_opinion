class ParseMorris < ParseBase
  def initialize(query)
    @query = query
  end

  def parse(size_of_array)
    result = Array.new
    new_row

    @query.each do |r|
      row[:date_created_at] = r[0][0]
      row[r[0][1]] = r[1]

      if row.length == size_of_array
        result << row
        new_row
      end
    end

    result
  end
end
