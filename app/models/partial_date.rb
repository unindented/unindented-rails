class PartialDate
  include ActiveAttr::Model

  attribute :category, type: String
  attribute :year,     type: Integer
  attribute :month,    type: Integer
  attribute :day,      type: Integer

  validates :category, :year, presence: true

  def to_a
    return nil unless valid?

    [year, month, day].compact
  end

  def to_range
    return nil unless valid?

    array = to_a
    msg = [:end_of_year, :end_of_month, :end_of_day][array.length - 1]
    min = Date.new(*array)
    max = min.clone.send(msg)
    min..max
  end

  def decorate
    PartialDateDecorator.decorate(self)
  end

end
