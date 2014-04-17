describe PartialDateDecorator do

  describe '#localize' do
    it 'returns a year' do
      date = FactoryGirl.build(:partial_date, year: 2013).decorate
      expect(date.localize).to eq('2013')
    end

    it 'returns a year and a month' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2).decorate
      expect(date.localize).to eq('February, 2013')
    end

    it 'returns a year, a month and a day' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2, day: 1).decorate
      expect(date.localize).to eq('February 1st, 2013')
    end
  end

  describe '#route' do
    it 'generates the route for a year' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013).decorate
      expect(date.route).to eq(helpers.archive_articles_path(year: '2013'))
    end

    it 'generates the route for a year and a month' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013, month: 2).decorate
      expect(date.route).to eq(helpers.archive_articles_path(year: '2013', month: '02'))
    end

    it 'generates the route for a year, a month and a day' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013, month: 2, day: 1).decorate
      expect(date.route).to eq(helpers.archive_articles_path(year: '2013', month: '02', day: '01'))
    end
  end

  describe '#parent_route' do
    it 'generates the parent route for a year' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013).decorate
      expect(date.parent_route).to eq(helpers.archive_articles_path)
    end

    it 'generates the parent route for a year and a month' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013, month: 2).decorate
      expect(date.parent_route).to eq(helpers.archive_articles_path(year: '2013'))
    end

    it 'generates the parent route for a year, a month and a day' do
      date = FactoryGirl.build(:partial_date, category: :articles, year: 2013, month: 2, day: 1).decorate
      expect(date.parent_route).to eq(helpers.archive_articles_path(year: '2013', month: '02'))
    end
  end

end
