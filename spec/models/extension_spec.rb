describe Extension do

  describe '#valid?' do
    it 'fails with no name' do
      expect(FactoryGirl.build(:extension, name: nil)).to have(1).error_on(:name)
    end

    it 'fails with duplicate name' do
      extension = FactoryGirl.create(:extension)
      expect(FactoryGirl.build(:extension, name: extension.name)).to have(1).error_on(:name)
    end
  end

  describe '#locator' do
    it 'gets generated based on the name' do
      extension = FactoryGirl.create(:extension, name: 'FooBar')
      expect(extension.locator).to eq('foobar')
    end
  end

  describe '#to_param' do
    it 'returns the locator' do
      extension = FactoryGirl.create(:extension, name: 'FooBar')
      expect(extension.to_param).to eq('foobar')
    end
  end

end
