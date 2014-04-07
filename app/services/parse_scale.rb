class ParseScale < ParseBase
  def initialize(query)
    @query = query
  end

  def parse
    result = Array.new
    new_row

    @query.each do |r|
      row['Total'] = r.total
      row['date_created_at']  = r.date_created_at
      result << row
      new_row
    end

    result
  end
end
