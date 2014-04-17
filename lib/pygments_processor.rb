require 'htmlentities'
require 'nokogiri'
require 'pygments'

class PygmentsProcessor

  DEFAULT_LANG = 'text'

  DEFAULT_OPTS = {
    elements:  ['pre', 'code'],
    attribute: 'class',
    pattern:   /language-(?<lang>\w+)/,
    misc:      {}
  }

  def initialize(opts = {})
    @coder = ::HTMLEntities.new
    @opts  = DEFAULT_OPTS.merge(opts)
  end

  def process(str)
    doc = ::Nokogiri::HTML::DocumentFragment.parse(str)
    search(doc).each { |node| highlight(node) }
    doc.to_html
  end

  private

  def search(doc)
    doc.css(@opts[:elements].join('>'))
  end

  def highlight(node)
    lang = extract_lang(node)
    code = @coder.decode(extract_html(node))

    target = find_parent(node)
    target.swap(pygments(lang, code, @opts[:misc].clone))
  end

  def extract_lang(node)
    attr = node[@opts[:attribute]]
    ((attr && @opts[:pattern].match(attr)) || { lang: DEFAULT_LANG })[:lang]
  end

  def extract_html(node)
    node.inner_html
  end

  def find_parent(node)
    target = node
    (@opts[:elements].length - 1).times { target = target.parent }
    target
  end

  def pygments(lang, code, opts = {})
    ::Pygments.highlight(code, formatter: 'html', lexer: lang, options: opts)
  end

end
