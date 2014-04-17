describe BodyProcessor do

  subject do
    BodyProcessor.new(
      kramdown: { enable_coderay: false },
      nokogiri: { css: 'table' },
      pygments: { misc: { cssclass: 'highlighted' } }
    )
  end

  describe '#process' do
    it 'processes the body of a content' do
      body = Capybara.string(subject.process(<<-eos
# Foo

| Bar | Baz |

```sh
echo 'Qux!'
```
      eos
      ))
      expect(body).to have_xpath('//div[@class="overflow"]/table')
      expect(body).to have_xpath('//div[@class="highlighted"]/pre')
    end

    it 'does not output a full HTML document' do
      body = subject.process(<<-eos
# Foo
      eos
      )
      expect(body).not_to include('DOCTYPE')
    end
  end

end

