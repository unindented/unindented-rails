class Tag < ActiveRecord::Base

  default_scope { order(:name) }

  has_many :content_tags
  has_many :contents, through: :content_tags

  validates :name, presence: true, uniqueness: true

  before_save :update_locator

  def self.counts
    select(['tags.*', 'count(content_tags.tag_id) as count'])
      .joins(:content_tags)
      .group('content_tags.tag_id')
  end

  def to_param
    self.locator
  end

  private

  def update_locator
    self.locator = self.name.parameterize
  end

end
