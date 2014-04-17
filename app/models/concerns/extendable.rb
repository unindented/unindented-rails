module Extendable
  extend ActiveSupport::Concern

  included do
    has_many :content_extensions
    has_many :extensions, through: :content_extensions
  end

  def extensions_list
    self.extensions.map(&:name)
  end

  def extensions_list=(names)
    self.extensions = (names || []).map { |name| Extension.find_or_create_by!(name: name) }
  end

end
