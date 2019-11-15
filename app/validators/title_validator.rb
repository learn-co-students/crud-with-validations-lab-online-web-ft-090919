class TitleValidator < ActiveModel::Validator
  def validate(record)
    songs_array = Song.where(release_year: record.release_year, artist_name: record.artist_name)
    if songs_array != nil && songs_array.any?{ |song| song.title == record.title}
      record.errors[:title] << "Title already been used for that year by this artist"
    end
  end
end