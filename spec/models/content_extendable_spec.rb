describe Content do

  describe '#extensions_list' do
    let(:extensions) do
      extensions = []
      extensions << FactoryGirl.build(:extension, name: 'Foo')
      extensions << FactoryGirl.build(:extension, name: 'Bar')
    end

    it 'returns an empty array when there are no extensions' do
      content = FactoryGirl.build(:content)
      expect(content.extensions_list).to be_empty
    end

    it 'returns an array with the extension names' do
      content = FactoryGirl.build(:content)
      content.extensions << extensions
      expect(content.extensions_list).to include('Foo', 'Bar')
    end
  end

  describe '#extensions_list=' do
    let(:extensions) do
      extensions = []
      extensions << FactoryGirl.build(:extension, name: 'Foo')
      extensions << FactoryGirl.build(:extension, name: 'Bar')
    end

    it 'clears all previous extensions' do
      content = FactoryGirl.build(:content)
      content.extensions << extensions
      content.extensions_list = []
      expect(content.extensions_list).to be_empty
    end

    it 'assigns the specified extensions' do
      content = FactoryGirl.build(:content)
      content.extensions << extensions
      content.extensions_list = ['Foo', 'Baz']
      expect(content.extensions_list).to include('Foo', 'Baz')
      expect(content.extensions_list).to_not include('Bar')
    end
  end

end
