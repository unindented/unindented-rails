describe OpenGraphHelper do

  describe '#open_graph_meta_tag' do
    it 'returns an Open Graph meta tag with the specified name and value' do
      meta = Capybara.string(helper.open_graph_meta_tag(:type, :website))
      expect(meta).to have_xpath("//meta[@property='og:type']", visible: false)
      expect(meta).to have_xpath("//meta[@content='website']", visible: false)
    end
  end

end
