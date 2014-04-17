describe TwitterHelper do

  describe '#twitter_card_meta_tag' do
    it 'returns a Twitter Card meta tag with the specified name and value' do
      meta = Capybara.string(helper.twitter_card_meta_tag(:card, :summary))
      expect(meta).to have_xpath("//meta[@name='twitter:card']", visible: false)
      expect(meta).to have_xpath("//meta[@content='summary']", visible: false)
    end
  end

end
