class ContentLoader

  def load(folder)
    Dir.chdir(Rails.root.join(folder)) do
      Dir.glob('**/index.metadata') do |filename|
        Content.create!(extract_data(filename))
      end
    end
  end

  private

  def extract_data(filename)
    [
      :extract_data_from_filename!,
      :extract_data_from_yaml!,
      :extract_data_from_markdown!,
      :generate_locator!,
      :generate_tags_list!,
      :generate_extensions_list!,
    ].reduce({}) { |data, method| self.send(method, data, filename) }
  end

  def extract_data_from_filename!(data, filename)
    match    = regex.match(filename)
    captures = Hash[match.names.zip(match.captures)]

    data.merge!(captures)
  end

  def extract_data_from_yaml!(data, filename)
    data.merge!(YAML.load_file(filename))
  end

  def extract_data_from_markdown!(data, filename)
    data.merge!({ 'body' => read_body(filename) })
  end

  def generate_locator!(data, filename)
    slug = data.delete('slug')
    rest = data.delete('rest')
    data['locator'] = File.join(data['category'], slug || rest).chomp('/')

    data
  end

  def generate_tags_list!(data, filename)
    data['tags_list'] = data.delete('tags')

    data
  end

  def generate_extensions_list!(data, filename)
    data['extensions_list'] = data.delete('extensions')

    data
  end

  def read_body(filename)
    path = "#{File.dirname(filename)}/#{File.basename(filename, '.*')}.md"
    File.read(path) if File.file?(path)
  end

  def regex
    @regex ||= /\A
      (?<path>
        (?<category>[^\/]+)
        (
          \/
          (?<date>\d{4}-\d{2}-\d{2})-(?<slug>[^\/]+)
          |
          (?<rest>.*?)
        )?
        \/
      )
      index.metadata
    \z/x
  end

end
