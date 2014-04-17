class HomeController < ApplicationController
  respond_to :html

  def show
    @about = Content
      .find_by!(locator: 'about')
      .decorate
    @contents = Content
      .categorized([:articles, :experiments])
      .prioritized
      .limit(6)
      .decorate

    respond_with @contents, layout: 'home'
  end

end
