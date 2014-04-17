describe Content do

  describe '#tags_list' do
    let(:tags) do
      tags = []
      tags << FactoryGirl.build(:tag, name: 'Foo')
      tags << FactoryGirl.build(:tag, name: 'Bar')
    end

    it 'returns an empty array when there are no tags' do
      content = FactoryGirl.build(:content)
      expect(content.tags_list).to be_empty
    end

    it 'returns an array with the tag names' do
      content = FactoryGirl.build(:content)
      content.tags << tags
      expect(content.tags_list).to include('Foo', 'Bar')
    end
  end

  describe '#tags_list=' do
    let(:tags) do
      tags = []
      tags << FactoryGirl.build(:tag, name: 'Foo')
      tags << FactoryGirl.build(:tag, name: 'Bar')
    end

    it 'clears all previous tags' do
      content = FactoryGirl.build(:content)
      content.tags << tags
      content.tags_list = []
      expect(content.tags_list).to be_empty
    end

    it 'assigns the specified tags' do
      content = FactoryGirl.build(:content)
      content.tags << tags
      content.tags_list = ['Foo', 'Baz']
      expect(content.tags_list).to include('Foo', 'Baz')
      expect(content.tags_list).to_not include('Bar')
    end
  end

end
