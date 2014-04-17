describe TagDecorator do

  describe '#route' do
    it 'returns the route for the tag' do
      tag = FactoryGirl.create(:tag).decorate
      expect(tag.route).to eq(helpers.tag_path(tag.locator))
    end
  end

  describe '#parent_route' do
    it 'returns the parent route for the tag' do
      tag = FactoryGirl.create(:tag).decorate
      expect(tag.parent_route).to eq(helpers.tags_path)
    end
  end

end
