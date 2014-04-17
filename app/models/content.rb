class Content < ActiveRecord::Base
  include Taggable
  include Extendable
  include Processable
  include Summarizable

  paginates_per 6

  default_scope       -> { published.order(date: :desc, title: :asc) }
  scope :prioritized, -> { reorder(featured: :desc, date: :desc, title: :asc) }
  scope :published,   -> { where(published: true) }
  scope :featured,    -> { where(featured: true) }
  scope :categorized, ->(category) { where(category: category) }
  scope :between,     ->(range) { range.present? ? where(date: range) : all }

  validates :title, :body, :path, :locator, :category, presence: true

  before_save :update_body, :update_abstract

  def previous
    # Only works because content is loaded into the database in the expected order.
    self.class
      .categorized(category)
      .where('id < :id', id: id)
      .reorder('id DESC')
      .first
  end

  def next
    # Only works because content is loaded into the database in the expected order.
    self.class
      .categorized(category)
      .where('id > :id', id: id)
      .reorder('id ASC')
      .first
  end

  def to_param
    self.locator
  end

  private

  def update_body
    self.body_html = process(self.body)
  end

  def update_abstract
    self.abstract      = summarize_text(self.body_html)
    self.abstract_html = summarize_html(self.body_html)
  end

end
