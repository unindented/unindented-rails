class ArchivesController < ApplicationController
  respond_to :html

  def show
    category = controller_name
    info     = params.slice(:year, :month, :day).merge(category: category)
    page     = params[:page]

    @date = PartialDate.new(info)
      .decorate
    @contents = Content
      .categorized(category)
      .between(@date.to_range)
      .page(page)
      .decorate

    respond_with @contents, layout: "#{category}_archive"
  end

end
