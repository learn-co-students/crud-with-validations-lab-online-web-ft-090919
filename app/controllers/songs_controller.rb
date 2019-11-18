class SongsController < ApplicationController

    def index 
        @songs = Song.all #show all the songs 
    end 

    def show 
        @song = Song.find(params[:id]) #find the song if in the params hash
    end 

    def new 
        @song = Song.new #create a new song 
    end 
    def edit 
        @song = Song.find(params[:id]) #find the song if in the params hash
    end 

    def create 
        @song = Song.new(song_params) #get all the params of the new song 
        if @song.save #save song with all of its params 
            redirect_to @song #send to song 
        else 
            render :new #if not go to the new page again 
        end 
    end 

    def update 
        @song = Song.find(params[:id]) #find the song if in the params hash
        if @song.update(song_params) #if there is a change in the params hash 
            redirect_to @song #send to song page 
        else 
            render :edit  #senf to the edit page 
        end 
    end 

    def destroy 
        @song = Song.find(params[:id]) #find the song if in the params hash
        @song.destroy # and delete it 
        redirect_to songs_url #send back to songs 
    end 

    private #the user cant minipualte the song params 

    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
        #for a song get all the info that the user submited 
    end 
end

