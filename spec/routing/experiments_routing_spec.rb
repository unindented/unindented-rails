describe ExperimentsController do

  describe 'routing' do
    it 'routes `/experiments` to #show' do
      expect(get '/experiments/').to route_to('experiments#show')
    end

    it 'routes `/experiments/2013` to #show' do
      expect(get '/experiments/2013/').to route_to(
        'experiments#show', year: '2013')
    end

    it 'routes `/experiments/2013/02` to #show' do
      expect(get '/experiments/2013/02/').to route_to(
        'experiments#show', year: '2013', month: '02')
    end

    it 'routes `/experiments/2013/02/01` to #show' do
      expect(get '/experiments/2013/02/01/').to route_to(
        'experiments#show', year: '2013', month: '02', day: '01')
    end
  end

  describe 'named routes' do
    it 'routes `experiments_path` to #show' do
      expect(get experiments_path).to route_to('experiments#show')
    end

    it 'routes `/experiments/2013` to #show' do
      expect(get archive_experiments_path(year: '2013')).to route_to(
        'experiments#show', year: '2013')
    end

    it 'routes `/experiments/2013/02` to #show' do
      expect(get archive_experiments_path(year: '2013', month: '02')).to route_to(
        'experiments#show', year: '2013', month: '02')
    end

    it 'routes `/experiments/2013/02/01` to #show' do
      expect(get archive_experiments_path(year: '2013', month: '02', day: '01')).to route_to(
        'experiments#show', year: '2013', month: '02', day: '01')
    end
  end

end
