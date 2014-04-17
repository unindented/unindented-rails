describe MetaHelper do

  describe '#humans_link_tag' do
    it 'returns a link to a `humans.txt` file' do
      link = Capybara.string(helper.humans_link_tag('/humans.txt'))
      expect(link).to have_xpath("//link[@rel='help']", visible: false)
      expect(link).to have_xpath("//link[@href='/humans.txt']", visible: false)
    end
  end

  describe '#icon_link_tag' do
    it 'returns a link to a favicon' do
      link = Capybara.string(helper.icon_link_tag(:png, '/favicon.png', sizes: '32x32'))
      expect(link).to have_xpath("//link[@rel='icon']", visible: false)
      expect(link).to have_xpath("//link[@type='image/png']", visible: false)
      expect(link).to have_xpath("//link[@href='/favicon.png']", visible: false)
      expect(link).to have_xpath("//link[@sizes='32x32']", visible: false)
    end
  end

  describe '#apple_icon_link_tag' do
    it 'returns a link to an Apple touch icon' do
      link = Capybara.string(helper.apple_icon_link_tag(:png, '/favicon.png', sizes: '32x32'))
      expect(link).to have_xpath("//link[@rel='apple-touch-icon-precomposed']", visible: false)
      expect(link).to have_xpath("//link[@type='image/png']", visible: false)
      expect(link).to have_xpath("//link[@href='/favicon.png']", visible: false)
      expect(link).to have_xpath("//link[@sizes='32x32']", visible: false)
    end
  end

  describe '#navigation_link_tag' do
    it 'returns a navigation link' do
      link = Capybara.string(helper.navigation_link_tag(:up, '/foobar/'))
      expect(link).to have_xpath("//link[@rel='up']", visible: false)
      expect(link).to have_xpath("//link[@href='/foobar/']", visible: false)
    end
  end

  describe '#feed_link_tag' do
    it 'returns a feed link' do
      link = Capybara.string(helper.feed_link_tag(:atom))
      expect(link).to have_xpath("//link[@rel='alternate']", visible: false)
      expect(link).to have_xpath("//link[@type='application/atom+xml']", visible: false)
      expect(link).to have_xpath("//link[@href='/feed.atom']", visible: false)
    end
  end

end
