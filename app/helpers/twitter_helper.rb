module TwitterHelper

  def twitter_card_meta_tag(name, value, options = {})
    tag(:meta, {
      name:    "twitter:#{name}",
      content: value
    }.merge!(options.symbolize_keys))
  end

end
