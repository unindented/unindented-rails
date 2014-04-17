describe MicrosoftHelper do

  describe '#msft_app_name_meta_tag' do
    it 'returns a Microsoft App meta tag with the application name' do
      meta = Capybara.string(helper.msft_app_name_meta_tag('FooBar'))
      expect(meta).to have_xpath("//meta[@name='application-name']", visible: false)
      expect(meta).to have_xpath("//meta[@content='FooBar']", visible: false)
    end
  end

  describe '#msft_app_config_meta_tag' do
    it 'returns a Microsoft App meta tag with the configuration file' do
      meta = Capybara.string(helper.msft_app_config_meta_tag('/browserconfig.xml'))
      expect(meta).to have_xpath("//meta[@name='msapplication-config']", visible: false)
      expect(meta).to have_xpath("//meta[@content='/browserconfig.xml']", visible: false)
    end
  end

end
