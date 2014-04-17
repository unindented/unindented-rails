describe PartialDate do

  describe '#valid?' do
    it 'fails with no category' do
      expect(FactoryGirl.build(:partial_date, category: nil)).to have(1).error_on(:category)
    end

    it 'fails with no year' do
      expect(FactoryGirl.build(:partial_date, year: nil)).to have(1).error_on(:year)
    end
  end

  describe '#to_a' do
    it 'returns nil if the date is not valid' do
      date = FactoryGirl.build(:partial_date, category: nil)
      expect(date.to_a).to be_nil
    end

    it 'returns an array with the year' do
      date = FactoryGirl.build(:partial_date, year: 2013)
      expect(date.to_a).to eq([2013])
    end

    it 'returns an array with the year and month' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2)
      expect(date.to_a).to eq([2013, 2])
    end

    it 'returns an array with the year, month and day' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2, day: 1)
      expect(date.to_a).to eq([2013, 2, 1])
    end
  end

  describe '#to_range' do
    it 'returns nil if the date is not valid' do
      date = FactoryGirl.build(:partial_date, category: nil)
      expect(date.to_a).to be_nil
    end

    it 'returns a range with the year' do
      date = FactoryGirl.build(:partial_date, year: 2013)
      expect(date.to_range).to cover(Date.new(2013), Date.new(2014) - 1)
      expect(date.to_range).to_not cover(Date.new(2014))
    end

    it 'returns a range with the year and month' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2)
      expect(date.to_range).to cover(Date.new(2013, 2), Date.new(2013, 3) - 1)
      expect(date.to_range).to_not cover(Date.new(2013, 3))
    end

    it 'returns a range with the year, month and day' do
      date = FactoryGirl.build(:partial_date, year: 2013, month: 2, day: 1)
      expect(date.to_range).to cover(Date.new(2013, 2, 1))
      expect(date.to_range).to_not cover(Date.new(2013, 1, 31), Date.new(2013, 2, 2))
    end

  end

end
