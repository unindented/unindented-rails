describe TagsController do

  describe 'routing' do
    it 'routes `/tags` to #index' do
      expect(get '/tags/').to route_to('tags#index')
    end

    it 'routes `/tags/foobar` to #show' do
      expect(get '/tags/foobar/').to route_to('tags#show', locator: 'foobar')
    end
  end

  describe 'named routes' do
    it 'routes `tags_path` to #index' do
      expect(get tags_path).to route_to('tags#index')
    end

    it 'routes `tag_path(:locator)` to #show' do
      expect(get tag_path('foobar')).to route_to('tags#show', locator: 'foobar')
    end
  end

end
