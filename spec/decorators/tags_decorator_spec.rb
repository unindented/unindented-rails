describe TagsDecorator do

  describe '#cloud_list' do
    it 'generates a tag cloud' do
      tags     = FactoryGirl.create_list(:tag, 2)
      contents = FactoryGirl.create_list(:content, 2)
      contents.each_with_index do |content, index|
        content.tags << tags[index % tags.length]
      end

      cloud = Tag.counts.decorate
      list = Capybara.string(cloud.cloud_list)
      expect(list).to have_xpath("//li/a[@rel='tag']", count: tags.length)
    end
  end

end
