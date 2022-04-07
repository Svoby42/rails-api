Rails.application.routes.draw do

  namespace "auth" do
    post "sign_up", to: "registrations#create"
    delete "destroy", to: "registrations#destroy"
  end

  get '/*a', to: 'application#not_found'
end
