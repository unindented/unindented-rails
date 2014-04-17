module Summarizable
  extend ActiveSupport::Concern

  included do
    summarizer = BodySummarizer.new

    define_method(:summarize_text) { |body_html| summarizer.summarize_text(body_html) }
    define_method(:summarize_html) { |body_html| summarizer.summarize_html(body_html) }
  end

end
