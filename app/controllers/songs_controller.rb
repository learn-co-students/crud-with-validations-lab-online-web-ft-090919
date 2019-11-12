
class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = current_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = current_song
  end

  def update
    @song = current_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    current_song.destroy if !!current_song
    redirect_to songs_path
  end

  private

  def current_song
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end

end