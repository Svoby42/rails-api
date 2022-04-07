Rails.application.routes.draw do

  namespace "auth" do
    post "sign_up", to: "registrations#create"
    delete "destroy", to: "registrations#destroy"
  end

  match '*foo', to: 'application#not_found', via: :get
end
