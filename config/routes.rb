Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/longestwordgame', to: 'longestwordgame#start'
  get '/new',             to: 'longestwordgame#new'
  get '/score',          to: 'longestwordgame#score'
end
