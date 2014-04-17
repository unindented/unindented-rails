describe Tag do

  describe '.counts' do
    it 'returns the content count for each tag' do
      tags     = FactoryGirl.create_list(:tag, 2)
      contents = FactoryGirl.create_list(:content, 2)
      contents.first.tags << [tags.first]
      contents.last.tags  << [tags.first, tags.last]

      counts = Tag.counts.reorder('id')
      expect(counts.first.count).to eq(2)
      expect(counts.last.count).to eq(1)
    end
  end

  describe '#valid?' do
    it 'fails with no name' do
      expect(FactoryGirl.build(:tag, name: nil)).to have(1).error_on(:name)
    end

    it 'fails with duplicate name' do
      tag = FactoryGirl.create(:tag)
      expect(FactoryGirl.build(:tag, name: tag.name)).to have(1).error_on(:name)
    end
  end

  describe '#locator' do
    it 'gets generated based on the name' do
      tag = FactoryGirl.create(:tag, name: 'FooBar')
      expect(tag.locator).to eq('foobar')
    end
  end

  describe '#to_param' do
    it 'returns the locator' do
      tag = FactoryGirl.create(:tag, name: 'FooBar')
      expect(tag.to_param).to eq('foobar')
    end
  end

end
