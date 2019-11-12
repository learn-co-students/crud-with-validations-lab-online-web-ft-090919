class Song < ApplicationRecord

  validates :title, :artist_name, presence: true
  # if released is true then must have value
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
  # cant be repeated by same artist in same year
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }








  def is_released?
    released
  end

end
