class FeedsController < ApplicationController
  respond_to :atom, :tile

  def show
    @contents = Content
      .categorized([:articles, :experiments])
      .includes(:tags)
      .limit(6)
      .decorate

    respond_with @contents
  end

end
