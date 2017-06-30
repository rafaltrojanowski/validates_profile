class TwitterValidator < ActiveModel::Validations::ProfileValidator
  def validate_each(record, attribute, value)
    unless value =~ Regexp.union(RegularExpressions::TWITTER_PROFIE_NAME, RegularExpressions::TWITTER_PROFILE_LINK)
      record.errors.add(attribute, options.fetch(:message), :value => value)
    end
  end
end
