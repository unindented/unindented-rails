class PartialDateDecorator < ModelDecorator
  delegate_all

  def localize
    array  = to_a
    format = [:year, :month, :day][array.length - 1]
    l(Date.new(*array), format: format)
  end

  def route
    convert_to_route(to_a)
  end

  def parent_route
    convert_to_route(to_a[0...-1])
  end

  private

  def convert_to_route(array)
    array = array.map { |v| v.to_s.rjust(2, '0') }
    send("archive_#{category}_path", Hash[[:year, :month, :day].zip(array)])
  end

end
