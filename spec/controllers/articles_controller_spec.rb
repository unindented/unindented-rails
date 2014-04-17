describe ArticlesController do

  describe 'GET show' do
    context 'without contents' do
      it 'has a 200 status code' do
        get :show
        expect(response.status).to eq(200)
      end
    end

    context 'with contents' do
      let!(:contents) { FactoryGirl.create_list(:content, 2, category: :articles) }

      it 'has a 200 status code' do
        get :show
        expect(response.status).to eq(200)
      end
    end
  end

end
