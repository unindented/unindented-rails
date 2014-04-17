class Extension < ActiveRecord::Base

  default_scope { order(:name) }

  has_many :content_extensions
  has_many :contents, through: :content_extensions

  validates :name, presence: true, uniqueness: true

  before_save :update_locator

  def to_param
    self.locator
  end

  private

  def update_locator
    self.locator = self.name.parameterize
  end

end
