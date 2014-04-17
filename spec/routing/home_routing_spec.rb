describe HomeController do

  describe 'routing' do
    it 'routes `/` to #show' do
      expect(get '/').to route_to('home#show')
    end
  end

  describe 'named routes' do
    it 'routes `root_path` to #show' do
      expect(get root_path).to route_to('home#show')
    end
  end

end
