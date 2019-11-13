class Song < ApplicationRecord
    validate :in_future
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?

    def released?
        self.released
    end

    def in_future
        if !!self.release_year
            if self.release_year > Time.now.year 
                errors.add(:release_year, "Must be released before the future")
            end
        end
    end
end
