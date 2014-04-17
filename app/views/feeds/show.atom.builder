root_url = absolute_url(nil)
feed_url = absolute_url(feed_path(format: :atom, trailing_slash: false))
feed_id  = "tag:#{feed_url}"

atom_feed(root_url: root_url, url: feed_url, id: feed_id) do |feed|
  feed.title(@contents.title)
  feed.subtitle(@contents.subtitle)
  feed.updated(@contents.updated) if @contents.length > 0

  feed.author do |author|
    author.name(@contents.author)
  end

  feed.rights(@contents.copyright)

  @contents.each do |content|
    content_url = absolute_url(content.route)
    content_id  = "tag:#{content_url}"

    feed.entry(content, url: content_url, id: content_id) do |entry|
      entry.title(content.title)
      entry.updated(content.datetime)

      entry.author do |author|
        author.name(content.author)
      end

      content.tags.each do |tag|
        entry.category(term: tag.to_param, label: tag.name)
      end

      entry.summary(content.abstract)
      entry.content(content.body_html, type: :html)
    end
  end
end
