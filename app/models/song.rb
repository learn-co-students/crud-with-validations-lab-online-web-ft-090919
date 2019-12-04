class Song < ApplicationRecord
  include ActiveModel::Validations
  validates_with TitleValidator
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
  end
end
