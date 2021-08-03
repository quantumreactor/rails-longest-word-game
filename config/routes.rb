Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root                    to: 'longestwordgame#start'
  get '/longestwordgame', to: 'longestwordgame#start'
  get '/new',             to: 'longestwordgame#new'
  post '/score',          to: 'longestwordgame#score'

end
