describe ErrorsController do

  describe 'GET show' do
    context 'with a 404 error' do
      it 'has a 200 status code' do
        get :show, error: '404'
        expect(response.status).to eq(200)
      end
    end

    context 'with a 500 error' do
      it 'has a 200 status code' do
        get :show, error: '500'
        expect(response.status).to eq(200)
      end
    end
  end

end
