module OpenGraphHelper

  def open_graph_meta_tag(name, value, options = {})
    tag(:meta, {
      property: "og:#{name}",
      content:  value
    }.merge!(options.symbolize_keys))
  end

end
