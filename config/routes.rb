Rails.application.routes.draw do

  get 'teams/:team/players', to: 'teams#list_players'
  
end
