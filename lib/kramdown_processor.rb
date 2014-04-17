require 'kramdown'

class KramdownProcessor

  DEFAULT_OPTS = {
  }

  def initialize(opts = {})
    @opts = DEFAULT_OPTS.merge(opts)
  end

  def process(str)
    convert_to_html(fix_fenced_blocks(str))
  end

  private

  def fix_fenced_blocks(str)
    str.gsub(/^```/, '~~~')
  end

  def convert_to_html(str)
    ::Kramdown::Document.new(str, @opts).to_html
  end

end
