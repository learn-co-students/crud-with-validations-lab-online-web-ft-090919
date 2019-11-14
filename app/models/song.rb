class Song < ApplicationRecord

    validates :title, presence: true 
    validates :title, uniqueness: { scope: :artist_name }

    validates :released, inclusion: { in: [true, false] }

    validates :release_year, length: { is: 4 }, presence: true, if: :released?

    validates :artist_name, presence: true 

    validate :bad_date


    def bad_date 
        if release_year.present? && release_year > Date.today.year 
            errors.add(:release_year, "Release year can't be in the future")
        end 
    end 
    
end
