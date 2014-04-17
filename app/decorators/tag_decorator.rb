class TagDecorator < ModelDecorator
  delegate_all

  def route
    tag_path(self)
  end

  def parent_route
    tags_path
  end

end
