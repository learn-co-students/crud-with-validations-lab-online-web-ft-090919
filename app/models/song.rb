class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, unless: Proc.new { |a| a.released == false}
    validate :release_year_cannot_be_in_the_future
    validate :cannot_release_same_song_twice_in_one_year


    def release_year_cannot_be_in_the_future
        if release_year && release_year.to_i > Date.today.year
            errors.add(:release_year, "can't be in the future")
        end
    end

    def cannot_release_same_song_twice_in_one_year
        song = Song.find_by(title: title)
        if song && song.release_year == release_year
            if song.id != id
                errors.add(:release_year, "can't release the same song twice in a year")
            end
        end

    end


end
