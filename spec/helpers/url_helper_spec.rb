describe UrlHelper do

  describe '#absolute_url' do
    before { allow(SETTINGS).to receive(:host) { 'http://www.foo.com' } }

    it 'returns the absolute URL for the specified path' do
      url = helper.absolute_url('/bar')
      expect(url).to eq('http://www.foo.com/bar')
    end
  end

  describe '#current_url' do
    before do
      allow(SETTINGS).to receive(:host) { 'http://www.foo.com' }
      allow(controller.request).to receive(:original_fullpath).and_return('/bar')
    end

    it 'returns the absolute current URL' do
      url = helper.current_url
      expect(url).to eq('http://www.foo.com/bar')
    end
  end

  describe '#email_url' do
    before { allow(SETTINGS).to receive(:email) { 'foo@bar.com' } }

    context 'without options' do
      it 'returns the URL to the configured email address' do
        url = helper.email_url
        expect(url).to eq('mailto:foo@bar.com')
      end
    end

    context 'with an email address' do
      it 'returns the URL to the specified email address' do
        url = helper.email_url('foo@baz.com')
        expect(url).to eq('mailto:foo@baz.com')
      end
    end

    context 'with a subject' do
      it 'returns the URL with the specified subject as a param' do
        url = helper.email_url('foo@baz.com', subject: 'Baz')
        expect(url).to eq('mailto:foo@baz.com?subject=Baz')
      end
    end
  end

  describe '#github_url' do
    before { allow(SETTINGS).to receive(:github) { 'foobar' } }

    context 'without options' do
      it 'returns the URL to the configured GitHub account' do
        url = helper.github_url
        expect(url).to eq('https://github.com/foobar')
      end
    end

    context 'with a handle' do
      it 'returns the URL to the specified GitHub account' do
        url = helper.github_url('foobaz')
        expect(url).to eq('https://github.com/foobaz')
      end
    end
  end

  describe '#twitter_url' do
    before { allow(SETTINGS).to receive(:twitter) { 'foobar' } }

    context 'without options' do
      it 'returns the URL to the specified Twitter account' do
        url = helper.twitter_url
        expect(url).to eq('https://twitter.com/foobar')
      end
    end

    context 'with a handle' do
      it 'returns the URL to the specified Twitter account' do
        url = helper.twitter_url('foobaz')
        expect(url).to eq('https://twitter.com/foobaz')
      end
    end
  end

  describe '#tweet_url' do
    context 'without options' do
      it 'returns the URL for the `tweet` intent' do
        url = helper.tweet_url
        expect(url).to eq('https://twitter.com/intent/tweet')
      end
    end

    context 'with a URL' do
      it 'returns the URL with the specified URL encoded as a param' do
        url = helper.tweet_url(url: 'http://foobar.com/')
        expect(url).to eq('https://twitter.com/intent/tweet?url=http%3A%2F%2Ffoobar.com%2F')
      end
    end

    context 'with a handle' do
      it 'returns the URL with the specified handle as a param' do
        url = helper.tweet_url(via: 'foobar')
        expect(url).to eq('https://twitter.com/intent/tweet?via=foobar')
      end
    end
  end

end
