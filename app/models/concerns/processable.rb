module Processable
  extend ActiveSupport::Concern

  included do
    processor = BodyProcessor.new({
      kramdown: SETTINGS.processors.kramdown_as_a_hash.deep_symbolize_keys,
      nokogiri: SETTINGS.processors.nokogiri_as_a_hash.deep_symbolize_keys,
      pygments: SETTINGS.processors.pygments_as_a_hash.deep_symbolize_keys
    })

    define_method(:process) { |body| processor.process(body) }
  end

end
