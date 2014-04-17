class TagsController < ApplicationController
  respond_to :html

  def index
    @tags = Tag
      .counts
      .decorate

    respond_with @tags, layout: 'tags'
  end

  def show
    locator = params[:locator]
    page    = params[:page]

    @tag = Tag
      .find_by!(locator: locator)
      .decorate
    @contents = @tag.contents
      .page(page)
      .decorate

    respond_with @contents, layout: 'tags'
  end

end
