#encoding: utf-8
module RegularExpressions
  FACEBOOK_PROFILE_NAME = /^[a-zA-Z0-9\.]*[a-zA-Z][a-zA-Z0-9\.]*$/
  GITHUB_PROFILE_NAME = /\A[a-zA-Z0-9]+[a-zA-Z0-9\-]+\Z/
  STACKOVERFLOW_PROFILE_NAME = /\A[a-zA-Z0-9ążśźęćół]+[a-zA-Z0-9ążśźęćńół\'\-\s\_]+\Z/
  TWITTER_PROFIE_NAME = /\A[a-zA-Z0-9\_]+\Z/

  TWITTER_PROFILE_LINK = /\A(https?:\/\/)?((w{3}\.)?)twitter\.com\/[a-zA-Z0-9\_]+\Z/
  GITHUB_PROFILE_LINK = /\A(https?:\/\/)?((w{3}\.)?)github\.com\/[a-zA-Z0-9]+[a-zA-Z0-9\-]+\Z/
  STACKOVERFLOW_PROFILE_LINK = /\A(https?:\/\/)?((w{3}\.)?)stackoverflow\.com\/users\/[0-9]+\/[a-zA-Z0-9]+[a-zA-Z0-9\-\_]+\Z/
  FACEBOOK_PROFILE_LINK = /\A((https?)\:\/\/)?(www\.)?((facebook\.com)\/[^\?](\A?)[^\/]+)\Z/
end
