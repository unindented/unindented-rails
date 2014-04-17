describe ContentsDecorator do

  let!(:contents) { FactoryGirl.create_list(:content, 3) }

  describe '#title' do
    it 'returns the title of the site' do
      feed = Content.all.decorate
      expect(feed.title).to eq(helpers.title_text)
    end
  end

  describe '#author' do
    it 'returns the subtitle of the site' do
      feed = Content.all.decorate
      expect(feed.subtitle).to eq(helpers.subtitle_text)
    end
  end

  describe '#updated' do
    it 'returns the date of the most recent content' do
      feed = Content.all.decorate
      expect(feed.updated).to eq(feed.first.datetime)
    end
  end

  describe '#author' do
    it 'returns the author of the site' do
      feed = Content.all.decorate
      expect(feed.author).to eq(helpers.author_text)
    end
  end

  describe '#copyright' do
    it 'returns the copyright of the site' do
      feed = Content.all.decorate
      expect(feed.copyright).to eq(helpers.copyright_text)
    end
  end

end
