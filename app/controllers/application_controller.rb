class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from Errno::ENOENT,                with: :render_404

  def render_404
    respond_to do |format|
      format.html { render 'errors/404', layout: 'errors', status: :not_found }
      format.any  { head :not_found }
    end
  end

end
