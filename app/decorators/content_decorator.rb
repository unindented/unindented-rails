class ContentDecorator < ModelDecorator
  delegate_all

  def datetime
    DateTime.parse(date.to_s)
  end

  def color
    (self.id % 6) + 1
  end

  def related
    p = self.previous
    n = self.next
    pp = p && p.previous
    nn = n && n.next
    rel = [pp, p, n, nn].compact
    rel.slice((rel.length - 1) / 2.0, 2).map(&:decorate)
  end

  def route
    content_path(self)
  end

  def parent_route
    send("archive_#{category}_path")
  end

  def previous_route
    p = self.previous
    p.decorate.route if p.present?
  end

  def next_route
    n = self.next
    n.decorate.route if n.present?
  end

  def date_route
    array = [date.year, date.month, date.day].map { |v| v.to_s.rjust(2, '0') }
    send("archive_#{category}_path", Hash[[:year, :month, :day].zip(array)])
  end

  def block_link(options = {}, &block)
    link_to(route, options, &block)
  end

  def title_link(options = {})
    link_to(title, route, options.symbolize_keys)
  end

  def date_link(options = {})
    link_to(time_tag(date, format: :day), date_route, { class: :date }.merge!(options.symbolize_keys))
  end

  def tags_links()
    tags.map do |tag|
      link_to(tag.name, tag_path(tag), class: :tag, rel: :tag)
    end
  end

  def tags_list(options = {})
    return if tags.length == 0

    items = tags_links.reduce('') do |memo, link|
      item = content_tag(:li, link)
      memo + item
    end

    content_tag(:ul, items.html_safe, { class: :tags, role: :navigation }.merge!(options.symbolize_keys))
  end

end
