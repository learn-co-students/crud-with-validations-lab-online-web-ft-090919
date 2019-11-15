class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true && record.release_year == nil
      record.errors[:release_year] << "Must not be left blank"
     elsif record.release_year.to_i > Date.today.year
      record.errors[:release_year] << "Year must be equal or lower than the current year"
    end
  end
end