describe TagsController do

  describe 'GET index' do
    let!(:tags) { FactoryGirl.create_list(:tag, 2) }

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    let!(:tag) { FactoryGirl.create(:tag, name: 'FooBar') }

    context 'with incorrect locator' do
      it 'has a 404 status code' do
        get :show, locator: 'bazqux'
        expect(response.status).to eq(404)
      end
    end

    context 'with correct locator' do
      it 'has a 200 status code' do
        get :show, locator: 'foobar'
        expect(response.status).to eq(200)
      end
    end
  end

end
