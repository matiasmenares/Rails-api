Rails.application.routes.draw do
	namespace :api,defaults: {format: :json} do
		namespace :v1 do
			#get 'users/:id',to: "users#show"
			resources :users, :only => [:show, :create]
		end
	end
end
