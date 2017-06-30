# ValidatesProfile

Custom validator for profile names/urls for AR models.
Currently supported services:
 - facebook
 - github
 - twitter
 - stackoverflow

### Instalation

  Add this line to your Gemfile

  gem 'validates_profile', :git => 'git://github.com/funkydrummer/validates_profile.git' 

  and run

  bundle install

### Usage

```ruby
class User < ActiveRecord::Base
  validates_profile :column_name,
                    type: [:facebook, :github, :twitter, :stackoverflow].sample
end
```

## Authors
Rafał Trojanowski
