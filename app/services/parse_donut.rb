class ParseDonut < ParseBase
  def initialize(query)
    @query = query
  end

  def parse
    result = Array.new
    new_row

    @query.each do |k, v|
      row[:label] = k
      row[:value] = v
      result << row
      new_row
    end

    result.to_json
  end
end
