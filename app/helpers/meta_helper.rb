module MetaHelper

  def humans_link_tag(source, options = {})
    tag(:link, {
      rel:  'help',
      type: 'text/plain',
      href: source
    }.merge!(options.symbolize_keys))
  end

  def icon_link_tag(format, url_options = {}, tag_options = {})
    tag(:link, {
      rel:  'icon',
      type: Mime::Type.lookup_by_extension(format.to_s).to_s,
      href: url_options.is_a?(Hash) ? url_for(url_options.merge(only_path: false)) : url_options
    }.merge!(tag_options.symbolize_keys))
  end

  def apple_icon_link_tag(format, url_options = {}, tag_options = {})
    icon_link_tag(format, url_options, tag_options.merge(rel: 'apple-touch-icon-precomposed'))
  end

  def navigation_link_tag(rel, url_options = {}, tag_options = {})
    tag(:link, {
      rel:  rel,
      href: url_options.is_a?(Hash) ? url_for(url_options.merge(only_path: false)) : url_options
    }.merge!(tag_options.symbolize_keys))
  end

  def feed_link_tag(type)
    auto_discovery_link_tag(type,
      feed_path(format: type, trailing_slash: false),
      type: Mime::Type.lookup_by_extension(type.to_s).to_s,
      title: t("shared.misc.#{type}"))
  end

end
