require 'nokogiri'

class BodySummarizer

  DEFAULT_OPTS = {
    xpath: './/p',
    range: 0...2
  }

  def initialize(opts = {})
    @opts = DEFAULT_OPTS.merge(opts)
  end

  def summarize_text(html)
    summarize(html).map(&:text).join(' ')
  end

  def summarize_html(html)
    summarize(html).map(&:to_html).join(' ')
  end

  private

  def summarize(html)
    doc = ::Nokogiri::HTML::DocumentFragment.parse(html)
    nodes = []
    nodes.push(*(doc.css(@opts[:css])))     unless @opts[:css].nil?
    nodes.push(*(doc.xpath(@opts[:xpath]))) unless @opts[:xpath].nil?
    nodes.slice(@opts[:range])
  end

end
