class ContentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    locator  = params[:locator]
    filename = params[:filename]

    if filename.present?
      render_file(locator, filename)
    else
      render_content(locator)
    end
  end

  private

  def render_file(locator, filename)
    @content = Content
      .find_by!(locator: locator)
      .decorate

    ext  = File.extname(filename).downcase.tr('.', '')
    type = Mime::Type.lookup_by_extension(ext)
    path = File.expand_path(File.join([Rails.root, 'contents', @content.path, filename]))

    send_data File.read(path), type: type, disposition: :inline
  end

  def render_content(locator)
    @content = Content
      .find_by!(locator: locator)
      .decorate

    render text: @content.body_html, layout: @content.category
  end

end
