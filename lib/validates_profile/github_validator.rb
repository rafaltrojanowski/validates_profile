class GithubValidator < ActiveModel::Validations::ProfileValidator
  def validate_each(record, attribute, value)
    unless value =~ Regexp.union(RegularExpressions::GITHUB_PROFILE_NAME, RegularExpressions::GITHUB_PROFILE_LINK)
      record.errors.add(attribute, options.fetch(:message), :value => value)
    end
  end
end
