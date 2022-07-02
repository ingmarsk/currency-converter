Rails.application.routes.draw do
  root to: 'currency_converter#new'

  get 'currency_converter/new'
  post 'currency_converter/convert'
end
