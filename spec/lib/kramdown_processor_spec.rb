describe KramdownProcessor do

  subject do
    KramdownProcessor.new(enable_coderay: false)
  end

  describe '#process' do
    it 'converts a bunch of Markdown to HTML' do
      body = Capybara.string(subject.process(<<-eos
# Foo
      eos
      ))
      expect(body).to have_xpath('//h1')
    end

    it 'recognizes blocks fenced with ```' do
      body = Capybara.string(subject.process(<<-eos
```sh
echo 'Foo!'
```
      eos
      ))
      expect(body).to have_xpath('//pre')
    end
  end

end
