Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contact_us, only: [:new, :create, :show]
  get '/invisible_recaptcha_new', to: 'contact_us#invisible_recaptcha', as: :new_invisible_recaptcha
  post '/invisible_recaptcha_create', to: 'contact_us#invisible_recaptcha_create', as: :invisible_recaptcha

  get '/contact_us/:id', to: redirect('/thank-you')

  root "contact_us#new"
end
