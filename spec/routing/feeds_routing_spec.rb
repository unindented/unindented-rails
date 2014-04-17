describe FeedsController do

  describe 'routing' do
    it 'routes `/feed.atom` to #show' do
      expect(get '/feed.atom').to route_to('feeds#show', format: 'atom')
    end

    it 'routes `/feed.tile` to #show' do
      expect(get '/feed.tile').to route_to('feeds#show', format: 'tile')
    end
  end

  describe 'named routes' do
    it 'routes `feed_path(format :atom)` to #show' do
      expect(get feed_path(format: :atom)).to route_to('feeds#show', format: 'atom')
    end

    it 'routes `feed_path(format: :tile)` to #show' do
      expect(get feed_path(format: :tile)).to route_to('feeds#show', format: 'tile')
    end
  end

end
