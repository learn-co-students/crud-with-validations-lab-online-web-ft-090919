class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :is_released?
    validate :in_future?



    def is_released?
        self.released
    end

    def in_future?
        if !!self.release_year 
            if self.release_year > Time.now.year
                errors.add(:release_year, "can't be released in the future")
            end
        end
    end
end
