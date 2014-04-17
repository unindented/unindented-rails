describe BodySummarizer do

  let(:html) do
    <<-eos
<h1>Foo</h1>
<p>Bar</p>
<p>Baz</p>
<p>Qux</p>
    eos
  end

  context 'without options' do

    subject do
      BodySummarizer.new
    end

    describe '#summarize_text' do
      it 'extracts the text from the first two paragraphs' do
        abstract = subject.summarize_text(html)
        expect(abstract).to eq('Bar Baz')
      end
    end

    describe '#summarize_html' do
      it 'extracts the HTML from the first two paragraphs' do
        abstract = Capybara.string(subject.summarize_html(html))
        expect(abstract).to have_xpath('//p', count: 2)
        expect(abstract.text).to eq('Bar Baz')
      end
    end

  end

  context 'with a CSS selector and a range' do

    subject do
      BodySummarizer.new(css: 'p', range: 1...2)
    end

    describe '#summarize_text' do
      it 'extracts the text from the specified paragraph' do
        abstract = subject.summarize_text(html)
        expect(abstract).to eq('Baz')
      end
    end

    describe '#summarize_html' do
      it 'extracts the HTML from the specified paragraph' do
        abstract = Capybara.string(subject.summarize_html(html))
        expect(abstract).to have_xpath('//p', count: 1)
        expect(abstract.text).to eq('Baz')
      end
    end

  end

  context 'with a XPath selector and a range' do

    subject do
      BodySummarizer.new(css: 'p', range: 1...2)
    end

    describe '#summarize_text' do
      it 'extracts the text from the specified paragraph' do
        abstract = subject.summarize_text(html)
        expect(abstract).to eq('Baz')
      end
    end

    describe '#summarize_html' do
      it 'extracts the HTML from the specified paragraph' do
        abstract = Capybara.string(subject.summarize_text(html))
        expect(abstract).to have_xpath('//p', count: 1)
        expect(abstract.text).to eq('Baz')
      end
    end

  end

end
