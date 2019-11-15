class SongsController < ApplicationController

  def index
    @songs = Song.all
  end
  
  def show
    @song = find_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_strong_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else 
      render :new
    end
  end

  def edit
    @song = find_song
  end

  def update
    @song = find_song
    @song.assign_attributes(song_strong_params)
    
    if @song.valid?
      @song.update(song_strong_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = find_song
    @song.destroy
    redirect_to songs_path
  end



  private

  def find_song
    Song.find_by_id(params[:id])
  end

  def song_strong_params
    params.require(:song).permit(:artist_name, :title, :released, :genre, :release_year)
  end


end
