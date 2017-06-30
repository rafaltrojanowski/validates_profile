require 'validates_profile'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/resources')
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'sqlite3'
require 'active_record'
require 'active_record/base'
require 'active_record/migration'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(
    "adapter"   => "sqlite3",
    "database"  => ":memory:"
)

# require File.join(File.dirname(__FILE__), '..', 'init')

autoload :FacebookUser,         'resources/facebook_user'
autoload :TwitterUser,          'resources/twitter_user'
autoload :GithubUser,           'resources/github_user'
autoload :StackoverflowUser,    'resources/stackoverflow_user'
autoload :UserWithProfiles,     'resources/user_with_profiles'

autoload :UserWithTypeAsString,  'resources/user_with_type_as_string'
autoload :UserWithTypeAsSymbol,  'resources/user_with_type_as_symbol'
autoload :UserWithTypeAsProc,    'resources/user_with_type_as_proc'

autoload :User,                 'resources/user'
autoload :UserWithNil,          'resources/user_with_nil'
autoload :UserWithBlank,        'resources/user_with_blank'
autoload :UserWithLegacySyntax, 'resources/user_with_legacy_syntax'
autoload :UserWithAr,           'resources/user_with_ar'
autoload :UserWithArLegacy,     'resources/user_with_ar_legacy'
