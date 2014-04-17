describe FeedsController do

  describe 'GET show :atom' do
    context 'without contents' do
      it 'has a 200 status code' do
        get :show, format: :atom
        expect(response.status).to eq(200)
      end
    end

    context 'with contents' do
      let!(:contents) { FactoryGirl.create_list(:content, 2) }

      it 'has a 200 status code' do
        get :show, format: :atom
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET show :tile' do
    context 'without contents' do
      it 'has a 200 status code' do
        get :show, format: :tile
        expect(response.status).to eq(200)
      end
    end

    context 'with contents' do
      let!(:contents) { FactoryGirl.create_list(:content, 2) }

      it 'has a 200 status code' do
        get :show, format: :tile
        expect(response.status).to eq(200)
      end
    end
  end

end
