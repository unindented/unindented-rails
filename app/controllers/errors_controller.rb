class ErrorsController < ArchivesController

  def show
    render params[:error], layout: 'errors'
  end

end
