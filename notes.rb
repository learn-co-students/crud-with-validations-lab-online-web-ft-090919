rails g resource Account name:string payment_status:string --no-test-framework

rails g resource Song title:string released:boolean release_year:integer artist_name:string genre:string --no-test-framework



class SongsController < ApplicationController

    def index 
      @songs = Song.all 
    end 
    
    def show
      @song = Song.find(params[:id])
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
      @song = Song.find(params[:id])
    end
  
    def update
      @song = Song.find(params[:id])
      if @song.update(song_params)
        redirect_to song_path(@song)
      else
        render :edit 
      end 
    end

    def destroy 
      Song.find(params[:id]).destroy
      redirect_to songs_path
    end 
  
    private
  
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
  
  end




  
<h2>Editing "<%= @song.title %>"</h2>
<% if @song.errors.any? %>
  <div id="error_explanation">
    <h2>There were some errors:</h2>
    <ul style="list-style-type:none">
      <% @song.errors.full_messages.each do |message| %>
        <li> <%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>

<%= form_tag song_path(@song), method: "patch" do %>
  <div class="field<%= ' field_with_errors' if @song.errors[:title].any? %>">
    <%= label_tag "title", "Title" %>
    <%= text_field_tag "title", @song.title %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:released].any? %>">
    <%= label_tag "released", "Released" %>
    <%= text_field_tag "released", @song.released %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:release_year].any? %>">
    <%= label_tag "release_year", "Release Year" %>
    <%= text_field_tag "release_year", @song.release_year %>
  </div>

  <div class="field <%= ' field_with_errors' if @song.errors[:artist_name].any? %>">
    <%= label_tag "artist_name", "Artist Name" %>
    <%= text_area_tag "artist_name", @song.artist_name %>
  </div>

  <div class="field <%= ' field_with_errors' if @song.errors[:genre].any? %>">
    <%= label_tag "genre", "Genre" %>
    <%= text_area_tag "genre", @song.genre %>
  </div>

  <%= submit_tag "Update" %>
<% end %>




<%= link_to "Delete", song, method: :delete, data: { confirm: "Really?" } %>
</div>
<% end %>