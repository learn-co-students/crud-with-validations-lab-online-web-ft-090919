class TitleValidator < ActiveModel::Validator
  def validate(record)
    song = Song.find_by(artist_name: record.artist_name, release_year: record.release_year, title: record.title)
    if song && song != record
      record.errors[:title] << "Title can't be repeated by the same artist during the same year"
    end
  end
end
