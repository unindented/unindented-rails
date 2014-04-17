require 'nokogiri'

class NokogiriProcessor

  DEFAULT_OPTS = {
  }

  def initialize(opts = {}, &block)
    @opts  = DEFAULT_OPTS.merge(opts).select { |key, value| [:css, :xpath].include?(key) }
    @block = block
  end

  def process(str)
    doc = ::Nokogiri::HTML::DocumentFragment.parse(str)
    @block.call(doc.css(@opts[:css]))     unless @opts[:css].nil?
    @block.call(doc.xpath(@opts[:xpath])) unless @opts[:xpath].nil?
    doc.to_html
  end

end
