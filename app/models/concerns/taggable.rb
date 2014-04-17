module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :content_tags
    has_many :tags, through: :content_tags
  end

  def tags_list
    self.tags.map(&:name)
  end

  def tags_list=(names)
    self.tags = (names || []).map { |name| Tag.find_or_create_by!(name: name) }
  end

end
