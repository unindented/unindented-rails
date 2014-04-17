Rails.application.routes.draw do

  archive_constraint  = { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/, page: /\d+/ }
  filename_constraint = { filename: /.+\.[a-z]+/ }

  root to: 'home#show'

  resource :feed, only: [:show]

  resource :articles, only: [:show], format: false do
    get '(:year(/:month(/:day)))(/page/:page)', action: :show, constraints: archive_constraint, as: :archive
  end

  resource :experiments, only: [:show], format: false do
    get '(:year(/:month(/:day)))(/page/:page)', action: :show, constraints: archive_constraint, as: :archive
  end

  resources :tags, only: [:index, :show], param: :locator, format: false do
    get 'page/:page', action: :show, on: :member, as: :archive
  end

  resources :errors, only: [:show], param: :error, format: false

  get '*locator/:filename', to: 'contents#show', format: false, constraints: filename_constraint, as: :file_content
  get '*locator',           to: 'contents#show', format: false, as: :content

end
