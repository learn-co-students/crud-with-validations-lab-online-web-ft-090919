Rails.application.routes.draw do

  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/songs', to: 'songs#index' #need a route for my index file
  # get '/songs/new', to: 'songs#new', as: 'new_song' #needed route to get new song 
  # post '/songs', to: 'songs#create' #the "go" ans in this will create a new song 
  # get '/songs/:id', to: 'songs#show', as: 'song' #show the songs uyou have created at the id that it has been created with 
  # get '/songs/:id/edit' to: 'songs#edit', as: 'edit_song' #get the song at the approite id then show the song you wanna edit 
  # patch '/songs/:id', to: 'songs#update' # get the song at the id KEEP THE SAME ONE and then chace somthing about it 
  # delete '/songs/:id', to: 'song#destroy' #the metal method 



  resources :songs #does it all for us (creates all of those routes ^^^^^^^^^^^^^^^^^^^)
end


