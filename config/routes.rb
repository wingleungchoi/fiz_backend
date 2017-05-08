Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :format => true, :constraints => {:format => :json} do

		namespace :v1 do

			resources :teams, :only => [] do
					collection do
						post 'winning_chance'
					end
				end # end teams

		end # end v1

	end # end api
end
