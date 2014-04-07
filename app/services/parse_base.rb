class ParseBase
  attr_accessor :row

protected
  def new_row
    self.row  = Hash.new
  end
end
