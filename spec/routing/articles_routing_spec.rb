describe ArticlesController do

  describe 'routing' do
    it 'routes `/articles` to #show' do
      expect(get '/articles/').to route_to('articles#show')
    end

    it 'routes `/articles/2013` to #show' do
      expect(get '/articles/2013/').to route_to(
        'articles#show', year: '2013')
    end

    it 'routes `/articles/2013/02` to #show' do
      expect(get '/articles/2013/02/').to route_to(
        'articles#show', year: '2013', month: '02')
    end

    it 'routes `/articles/2013/02/01` to #show' do
      expect(get '/articles/2013/02/01/').to route_to(
        'articles#show', year: '2013', month: '02', day: '01')
    end
  end

  describe 'named routes' do
    it 'routes `articles_path` to #show' do
      expect(get articles_path).to route_to('articles#show')
    end

    it 'routes `/articles/2013` to #show' do
      expect(get archive_articles_path(year: '2013')).to route_to(
        'articles#show', year: '2013')
    end

    it 'routes `/articles/2013/02` to #show' do
      expect(get archive_articles_path(year: '2013', month: '02')).to route_to(
        'articles#show', year: '2013', month: '02')
    end

    it 'routes `/articles/2013/02/01` to #show' do
      expect(get archive_articles_path(year: '2013', month: '02', day: '01')).to route_to(
        'articles#show', year: '2013', month: '02', day: '01')
    end
  end

end
