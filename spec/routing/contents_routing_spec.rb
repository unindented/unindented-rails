describe ContentsController do

  describe 'routing' do
    it 'routes `/about` to #show' do
      expect(get '/about/').to route_to(
        'contents#show', locator: 'about')
    end

    it 'routes `/articles/foobar` to #show' do
      expect(get '/articles/foobar/').to route_to(
        'contents#show', locator: 'articles/foobar')
    end

    it 'routes `/articles/foobar/image.png` to #show' do
      expect(get '/articles/foobar/image.png').to route_to(
        'contents#show', locator: 'articles/foobar', filename: 'image.png')
    end

    it 'routes `/experiments/foobar` to #show' do
      expect(get '/experiments/foobar/').to route_to(
        'contents#show', locator: 'experiments/foobar')
    end

    it 'routes `/experiments/foobar/image.png` to #show' do
      expect(get '/experiments/foobar/image.png').to route_to(
        'contents#show', locator: 'experiments/foobar', filename: 'image.png')
    end
  end

  describe 'named routes' do
    it 'routes `content_path(:locator) to #show`' do
      expect(get content_path('foobar')).to route_to(
        'contents#show', locator: 'foobar')
    end

    it 'routes `file_content_path(:locator, :filename) to #show`' do
      expect(get file_content_path(locator: 'foobar', filename: 'bazqux.png')).to route_to(
        'contents#show', locator: 'foobar', filename: 'bazqux.png')
    end
  end

end
