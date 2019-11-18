class Song < ActiveRecord::Base 
    validates :title, presence: true #check is there is a title 
    validates :title, uniqueness: true #checks to see if the title is uniq 
    validates :released, inclusion: {in: [true, false]} #checks if a song is released or not (by seeing if the boolean val is t or f )
    validates :artist_name, presence: true #checks if there is an artist name 



    with_options if: :released? do |song| #if the song is realsed do somthing 
        song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
      end
      #it validates a song on relase year making sure its older than right now 


    def released?
        released
    end 
end


