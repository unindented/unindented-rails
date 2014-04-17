class ContentsDecorator < CollectionDecorator
  delegate :current_page, :total_pages, :limit_value

  def title
    title_text
  end

  def subtitle
    subtitle_text
  end

  def updated
    first.datetime
  end

  def author
    author_text
  end

  def copyright
    copyright_text
  end

end
