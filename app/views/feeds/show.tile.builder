tile_feed do |feed|
  feed.binding(template: 'TileSquare150x150Text04', fallback: 'TileSquareImage') do
    content = @contents.first
    feed.text(content.title, id: '1')
  end if @contents.length > 0

  feed.binding(template: 'TileWide310x150Text09', fallback: 'TileWideImage') do
    content = @contents.first
    feed.text(content.title, id: '1')
    feed.text(content.abstract, id: '2')
  end if @contents.length > 0

  feed.binding(template: 'TileSquare310x310TextList03', contentId: @contents.first.id) do
    @contents.first(3).each_with_index do |content, index|
      feed.text(content.title, id: "#{2 * index + 1}")
      feed.text(content.abstract, id: "#{2 * index + 2}")
    end
  end if @contents.length > 0
end
