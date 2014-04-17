describe ContentsController do

  describe 'GET show' do
    let!(:content) { FactoryGirl.create(:content, locator: 'foobar') }

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

    context 'with correct locator but incorrect filename' do
      it 'has a 404 status code' do
        path = File.join([Rails.root, 'contents', content.path, 'bazqux.png'])
        allow(File).to receive(:read).with(path).and_raise(Errno::ENOENT)

        get :show, locator: 'foobar', filename: 'bazqux.png'
        expect(response.status).to eq(404)
      end
    end

    context 'with correct locator and correct filename' do
      it 'has a 200 status code' do
        path = File.join([Rails.root, 'contents', content.path, 'bazqux.png'])
        allow(File).to receive(:read).with(path).and_return(double())

        get :show, locator: 'foobar', filename: 'bazqux.png'
        expect(response.status).to eq(200)
      end
    end
  end

end
