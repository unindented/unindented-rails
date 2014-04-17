describe PygmentsProcessor do

  subject do
    PygmentsProcessor.new(misc: { cssclass: 'highlighted' })
  end

  describe '#process' do
    it 'highlights a preformatted block' do
      body = Capybara.string(subject.process(<<-eos
<pre>
  <code class="language-sh">echo 'Foo!'</code>
</pre>
      eos
      ))
      expect(body).to have_xpath('//div[@class="highlighted"]/pre')
    end
  end

end
