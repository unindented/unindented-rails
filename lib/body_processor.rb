require 'kramdown_processor'
require 'nokogiri_processor'
require 'pygments_processor'

class BodyProcessor

  def initialize(opts = {})
    @kramdown = KramdownProcessor.new(opts[:kramdown])
    @nokogiri = NokogiriProcessor.new(opts[:nokogiri]) do |nodes|
      nodes.wrap '<div class="overflow"></div>'
    end
    @pygments = PygmentsProcessor.new(opts[:pygments])
  end

  def process(body, opts = {})
    body = @kramdown.process(body)
    body = @nokogiri.process(body)
    body = @pygments.process(body)
  end

end
