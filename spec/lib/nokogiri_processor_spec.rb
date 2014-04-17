describe NokogiriProcessor do

  let(:html) do
    <<-eos
<h1>Foo</h1>
    eos
  end

  context 'with a CSS selector' do

    subject do
      NokogiriProcessor.new(css: 'h1') do |nodes|
        nodes.wrap '<div class="header"></div>'
      end
    end

    describe '#process' do
      it 'executes the specified block on matching nodes' do
        body = Capybara.string(subject.process(html))
        expect(body).to have_xpath('//div[@class="header"]/h1')
      end
    end

  end

  context 'with a XPath selector' do

    subject do
      NokogiriProcessor.new(xpath: './/h1') do |nodes|
        nodes.wrap '<div class="header"></div>'
      end
    end

    describe '#process' do
      it 'executes the specified block on matching nodes' do
        body = Capybara.string(subject.process(html))
        expect(body).to have_xpath('//div[@class="header"]/h1')
      end
    end

  end

end
