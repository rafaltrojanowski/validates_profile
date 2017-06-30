class FacebookValidator < ActiveModel::Validations::ProfileValidator
  def validate_each(record, attribute, value)
    if  value.length < 5
      record.errors.add(attribute, options.fetch(:message), :value => value)
    end

    unless value =~ Regexp.union(RegularExpressions::FACEBOOK_PROFILE_NAME, RegularExpressions::FACEBOOK_PROFILE_LINK)
      record.errors.add(attribute, options.fetch(:message), :value => value)
    end
  end
end
