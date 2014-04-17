class TagsDecorator < CollectionDecorator
  delegate :current_page, :total_pages, :limit_value

  def cloud_list(classes = %w{s m l})
    return if length == 0

    max = max_by(&:count)
    items = reduce('') do |memo, tag|
      index = ((classes.size - 1.0) * tag.count / max.count).round
      link = link_to(tag.name, tag_path(tag), class: :tag, rel: :tag)
      item = content_tag(:li, link, class: classes[index])
      memo + item
    end

    content_tag(:ul, items.html_safe, class: [:cloud, :container])
  end

end
