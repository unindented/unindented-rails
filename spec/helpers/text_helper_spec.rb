describe TextHelper do

  describe '#host_text' do
    it 'returns the host of the site' do
      allow(SETTINGS).to receive(:host) { 'http://www.foo.com' }
      expect(helper.host_text).to eq('http://www.foo.com')
    end
  end

  describe '#website_text' do
    it 'returns the name of the site' do
      allow(SETTINGS).to receive(:website) { 'FooBar' }
      expect(helper.website_text).to eq('FooBar')
    end
  end

  describe '#author_text' do
    it 'returns the author of the site' do
      allow(SETTINGS).to receive(:author) { 'John Doe' }
      expect(helper.author_text).to eq('John Doe')
    end
  end

  describe '#email_text' do
    it 'returns the email of the creator' do
      allow(SETTINGS).to receive(:email) { 'foo@bar.com' }
      expect(helper.email_text).to eq('foo@bar.com')
    end
  end

  describe '#twitter_text' do
    it 'returns the Twitter handle of the creator' do
      allow(SETTINGS).to receive(:twitter) { 'foobar' }
      expect(helper.twitter_text).to eq('foobar')
    end
  end

  describe '#github_text' do
    it 'returns the GitHub handle of the creator' do
      allow(SETTINGS).to receive(:github) { 'foobar' }
      expect(helper.github_text).to eq('foobar')
    end
  end

  describe '#title_text' do
    it 'returns the title of the site' do
      allow(SETTINGS).to receive(:website) { 'FooBar' }
      title = t(:title, website: 'FooBar')
      expect(helper.title_text).to eq(title)
    end
  end

  describe '#subtitle_text' do
    it 'returns the subtitle of the site' do
      allow(SETTINGS).to receive(:author) { 'John Doe' }
      subtitle = t(:subtitle, author: 'John Doe')
      expect(helper.subtitle_text).to eq(subtitle)
    end
  end

  describe '#copyright_text' do
    it 'returns the subtitle of the site' do
      allow(SETTINGS).to receive(:author) { 'John Doe' }
      copyright = t('shared.page_meta.copyright',
        author:  'John Doe',
        license: t('shared.page_meta.license')
      )
      expect(helper.copyright_text).to eq(copyright)
    end
  end

end
