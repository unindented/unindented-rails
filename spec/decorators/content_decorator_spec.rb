describe ContentDecorator do

  describe '#datetime' do
    it 'returns the date in long ISO 8601 format' do
      content = FactoryGirl.build(:content).decorate
      expect(content.datetime.to_s).to match(/\d{4}-\d{2}-\d{2}T00:00:00\+00:00/)
    end
  end

  describe '#related' do
    let (:content) { FactoryGirl.build(:content).decorate }
    let (:related) { double(decorate: true, previous: nil, next: nil) }

    context 'with next content' do
      before do
        allow(content).to receive(:previous).and_return(nil)
        allow(content).to receive(:next).and_return(related)
      end

      it 'returns an array with the next content' do
        expect(content.related).to have(1).item
        expect(related).to have_received(:decorate)
      end
    end

    context 'with previous content' do
      before do
        allow(content).to receive(:next).and_return(nil)
        allow(content).to receive(:previous).and_return(related)
      end

      it 'returns an array with the previous content' do
        expect(content.related).to have(1).item
        expect(related).to have_received(:decorate)
      end
    end

    context 'with no next or previous content' do
      before do
        allow(content).to receive(:next).and_return(nil)
        allow(content).to receive(:previous).and_return(nil)
      end

      it 'returns an empty array' do
        expect(content.related).to be_empty
      end
    end
  end

  describe '#route' do
    it 'returns the route for the content' do
      content = FactoryGirl.build(:content).decorate
      expect(content.route).to eq(helpers.content_path(content))
    end
  end

  describe '#parent_route' do
    it 'returns the parent route for the content' do
      content = FactoryGirl.build(:content, category: :articles).decorate
      expect(content.parent_route).to eq(helpers.archive_articles_path)
    end
  end

  describe '#previous_route' do
    let (:content) { FactoryGirl.build(:content).decorate }
    let (:related) { double(decorate: double(route: 'foobar')) }

    context 'with previous content' do
      before do
        allow(content).to receive(:previous).and_return(related)
      end

      it 'returns the route for the previous content' do
        expect(content.previous_route).to eq(related.decorate.route)
      end
    end
  end

  describe '#next_route' do
    let (:content) { FactoryGirl.build(:content).decorate }
    let (:related) { double(decorate: double(route: 'foobar')) }

    context 'with next content' do
      before do
        allow(content).to receive(:next).and_return(related)
      end

      it 'returns the route for the next content' do
        expect(content.next_route).to eq(related.decorate.route)
      end
    end
  end

  describe '#date_route' do
    it 'returns the date route for the content' do
      content = FactoryGirl.build(:content, category: :articles, date: Date.new(2013, 2, 1)).decorate
      expect(content.date_route).to eq(helpers.archive_articles_path(year: '2013', month: '02', day: '01'))
    end
  end

  describe '#block_link' do
    it 'generates a link to the content with the result of a block' do
      content = FactoryGirl.build(:content).decorate

      link = Capybara.string(content.block_link { 'Foo' })
      expect(link).to have_xpath("//a[@href='#{content.route}']")
      expect(link).to have_text('Foo')
    end
  end

  describe '#title_link' do
    it 'generates a link to the content with its title as text' do
      content = FactoryGirl.build(:content).decorate

      link = Capybara.string(content.title_link)
      expect(link).to have_xpath("//a[@href='#{content.route}']")
      expect(link).to have_text(content.title)
    end
  end

  describe '#date_link' do
    it 'generates a link to the archive with its date as text' do
      content = FactoryGirl.build(:content).decorate

      link = Capybara.string(content.date_link)
      expect(link).to have_xpath("//a[@href='#{content.date_route}']/time")
      expect(link).to have_text(helpers.l(content.date, format: :day))
    end
  end

  describe '#tags_list' do
    it 'generates a list of links with the content tags' do
      tags    = FactoryGirl.create_list(:tag, 3)
      content = FactoryGirl.build(:content).decorate
      content.tags << tags

      list = Capybara.string(content.tags_list)
      expect(list).to have_xpath("//li/a[@rel='tag']", count: tags.length)
    end
  end

end
