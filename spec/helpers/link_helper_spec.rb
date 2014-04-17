describe LinkHelper do

  describe '#email_link' do
    before { allow(SETTINGS).to receive(:email) { 'foo@bar.com' } }

    context 'without text' do
      it 'returns a link with the configured email address' do
        link = Capybara.string(helper.email_link)
        expect(link).to have_xpath("//a[@href='mailto:foo@bar.com']")
        expect(link).to have_text('foo@bar.com')
      end
    end

    context 'with text' do
      it 'returns a link with the specified text' do
        link = Capybara.string(helper.email_link('Foo Bar'))
        expect(link).to have_xpath("//a[@href='mailto:foo@bar.com']")
        expect(link).to have_text('Foo Bar')
      end
    end

    context 'with a subject' do
      it 'returns a link with the specified subject as a param' do
        link = Capybara.string(helper.email_link('Foo Bar', subject: 'Baz'))
        expect(link).to have_xpath("//a[@href='mailto:foo@bar.com?subject=Baz']")
        expect(link).to have_text('Foo Bar')
      end
    end
  end

  describe '#github_link' do
    before { allow(SETTINGS).to receive(:github) { 'foobar' } }

    context 'without text' do
      it 'returns a link to the configured GitHub account' do
        link = Capybara.string(helper.github_link)
        expect(link).to have_xpath("//a[@href='https://github.com/foobar']")
        expect(link).to have_text('@foobar')
      end
    end

    context 'with text' do
      it 'returns a link with the specified text' do
        link = Capybara.string(helper.github_link('Foo Bar'))
        expect(link).to have_xpath("//a[@href='https://github.com/foobar']")
        expect(link).to have_text('Foo Bar')
      end
    end
  end

  describe '#twitter_link' do
    before { allow(SETTINGS).to receive(:twitter) { 'foobar' } }

    context 'without text' do
      it 'returns a link to the configured Twitter account' do
        link = Capybara.string(helper.twitter_link)
        expect(link).to have_xpath("//a[@href='https://twitter.com/foobar']")
        expect(link).to have_text('@foobar')
      end
    end

    context 'with text' do
      it 'returns a link with the specified text' do
        link = Capybara.string(helper.twitter_link('Foo Bar'))
        expect(link).to have_xpath("//a[@href='https://twitter.com/foobar']")
        expect(link).to have_text('Foo Bar')
      end
    end
  end

  describe '#tweet_link' do
    before { allow(SETTINGS).to receive(:twitter) { 'foobar' } }

    context 'without text' do
      it 'returns a link to the `tweet` intent' do
        link = Capybara.string(helper.tweet_link)
        expect(link).to have_xpath("//a[@href='https://twitter.com/intent/tweet']")
        expect(link).to have_text('@foobar')
      end
    end

    context 'with text' do
      it 'returns a link with the specified text' do
        link = Capybara.string(helper.tweet_link('Foo Bar'))
        expect(link).to have_xpath("//a[@href='https://twitter.com/intent/tweet']")
        expect(link).to have_text('Foo Bar')
      end
    end

    context 'with a URL' do
      it 'returns a link with the specified URL as a param' do
        link = Capybara.string(helper.tweet_link('Foo Bar', url: 'http://foobar.com/'))
        expect(link).to have_xpath("//a[@href='https://twitter.com/intent/tweet?url=http%3A%2F%2Ffoobar.com%2F']")
        expect(link).to have_text('Foo Bar')
      end
    end

    context 'with a handle' do
      it 'returns a link with the specified handle as a param' do
        link = Capybara.string(helper.tweet_link('Foo Bar', via: 'foobar'))
        expect(link).to have_xpath("//a[@href='https://twitter.com/intent/tweet?via=foobar']")
        expect(link).to have_text('Foo Bar')
      end
    end
  end

end
