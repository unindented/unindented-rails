describe Content do

  describe '#valid?' do
    it 'fails with no title' do
      expect(FactoryGirl.build(:content, title: nil)).to have(1).error_on(:title)
    end

    it 'fails with no body' do
      expect(FactoryGirl.build(:content, body: nil)).to have(1).error_on(:body)
    end

    it 'fails with no path' do
      expect(FactoryGirl.build(:content, path: nil)).to have(1).error_on(:path)
    end

    it 'fails with no locator' do
      expect(FactoryGirl.build(:content, locator: nil)).to have(1).error_on(:locator)
    end

    it 'fails with no category' do
      expect(FactoryGirl.build(:content, category: nil)).to have(1).error_on(:category)
    end
  end

  describe '#body_html' do
    it 'gets generated before save' do
      content = FactoryGirl.create(:content, body: "*Foo bar*")
      expect(content.body_html).to include("<p><em>Foo bar</em></p>")
    end
  end

  describe '#previous' do
    context 'when there is no previous content' do
      it 'returns nil' do
        content1 = FactoryGirl.create(:content, category: :foobar, date: 3.day.ago)
        content2 = FactoryGirl.create(:content, category: :foobar, date: 2.days.ago)
        content3 = FactoryGirl.create(:content, category: :foobar, date: 1.days.ago)
        content4 = FactoryGirl.create(:content, category: :bazqux, date: 4.day.ago)

        expect(content1.previous).to be_nil
      end
    end

    context 'when there is previous content' do
      it 'returns the previous content' do
        content1 = FactoryGirl.create(:content, category: :foobar, date: 3.day.ago)
        content2 = FactoryGirl.create(:content, category: :foobar, date: 2.days.ago)
        content3 = FactoryGirl.create(:content, category: :foobar, date: 1.days.ago)
        content4 = FactoryGirl.create(:content, category: :bazqux, date: 3.day.ago)

        expect(content2.previous).to eq(content1)
      end
    end
  end

  describe '#next' do
    context 'when there is no next content' do
      it 'returns nil' do
        content1 = FactoryGirl.create(:content, category: :foobar, date: 3.day.ago)
        content2 = FactoryGirl.create(:content, category: :foobar, date: 2.days.ago)
        content3 = FactoryGirl.create(:content, category: :foobar, date: 1.days.ago)
        content4 = FactoryGirl.create(:content, category: :bazqux, date: 0.days.ago)

        expect(content3.next).to be_nil
      end
    end

    context 'when there is next content' do
      it 'returns the next content' do
        content1 = FactoryGirl.create(:content, category: :foobar, date: 3.day.ago)
        content2 = FactoryGirl.create(:content, category: :foobar, date: 2.days.ago)
        content3 = FactoryGirl.create(:content, category: :foobar, date: 1.days.ago)
        content4 = FactoryGirl.create(:content, category: :bazqux, date: 1.days.ago)

        expect(content2.next).to eq(content3)
      end
    end
  end

  describe '#to_param' do
    it 'returns the locator' do
      content = FactoryGirl.build(:content, locator: 'foo/bar')
      expect(content.to_param).to eq('foo/bar')
    end
  end

end
