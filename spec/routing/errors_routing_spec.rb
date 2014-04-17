describe ErrorsController do

  describe 'routing' do
    it 'routes `/errors/404` to #show' do
      expect(get '/errors/404/').to route_to(
        'errors#show', error: '404')
    end

    it 'routes `/errors/500` to #show' do
      expect(get '/errors/500/').to route_to(
        'errors#show', error: '500')
    end
  end

  describe 'named routes' do
    it 'routes `error_path(:error) to #show`' do
      expect(get error_path('404')).to route_to(
        'errors#show', error: '404')
    end

    it 'routes `error_path(:error) to #show`' do
      expect(get error_path('500')).to route_to(
        'errors#show', error: '500')
    end
  end

end
