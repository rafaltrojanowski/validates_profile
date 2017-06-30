#encoding: utf-8
require 'spec_helper'

describe "Profile validator" do

  before(:all) do
    ActiveRecord::Schema.define(:version => 1) do

      create_table :users, :force => true do |t|
        t.column :profile, :string
        t.column :kind, :string
      end
    end
  end

  after(:all) do
    ActiveRecord::Base.connection.drop_table(:users)
  end

  describe "facebook " do
    context "username" do
      before do
        @facebook_user = FacebookUser.new
      end

      context "valid" do
        it "must allow an alphanumeric with dot" do
          @facebook_user.profile = "fun.drummer5"
          @facebook_user.should be_valid
        end
      end

      context "not valid examples" do
        #@TODO
        # it "must be at least 6 characters" do
          # @facebook_user.profile = "abcd"
          # @facebook_user.should_not be_valid
        # end

        it "should not allow an profile name like this" do
          ["not_valid", "not valid", "abcdeł", "213.124", "raf,al", "https:", "rafal!", "(rafal)", "123456", "......"].each do |s|
            @facebook_user.profile = s
            @facebook_user.should_not be_valid
          end
        end
      end

    context "link" do
      context "valid examples" do
        it "must be valid" do
          ["http://www.facebook.com/fun.drummer", "http://www.facebook.com/profile.php?id=12423"].each do |s|
            @facebook_user.profile = s
            @facebook_user.should be_valid
          end
        end
      end

      context "not valid examples" do
        it "must not be valid" do
          ["vimeo.com/4234234",
           "http://www.vimeo.com/123312432534",
           "http://www.facebook.com////////",
           "http://www.facebook.com/find-friends/browser/",
           "http://www.facebook.com/?ref=logo",
           "http://www.facebook.com/pages/Liceum-w-Muszynie/114642458552105",
          ].each do |link|
            @facebook_user.profile = link
            @facebook_user.should_not be_valid
            end
          end
        end
      end
    end
  end

  describe "github" do
    before do
      @github_user = GithubUser.new
    end

    context "username" do
      #Username may only contain alphanumeric characters or dashes and cannot begin with a dash
      # (maximum is 40 characters) #@TODO
      context "valid" do
        it "must be alphanumeric with dash" do
          @github_user.profile = "4lPH4-num3r1c-"
          @github_user.should be_valid
        end
      end

      context "not valid" do
        it "cannot begin with a dash" do
          @github_user.profile = "-alpha1234"
          @github_user.should_not be_valid
        end
      end
    end

    context "link" do
      context "valid examples" do
        it "must not be valid" do
          [
            "https://github.com/funky-d-rumm34er",
            "http://github.com/324234-",
            "https://www.github.com/funky----",
            "http://www.github.com/funkydrummer",
            "www.github.com/funkyDrummerR",
            "github.com/funky-dr-dr-drummer"
          ].each do |s|
            @github_user.profile = s
            @github_user.should be_valid
          end 
        end
      end

      context "not valid examples" do
        it "must not be valid" do
          [
            "github.com/funky_drummer",
            "github.com/-funkydrummer23",
            "github.com/funk/drum23",
            "github.com/funk:drum"
          ].each do |s|
            @github_user.profile = s
            @github_user.should_not be_valid
          end
        end
      end
    end
  end

  describe "stackoverflow" do
    before do
      @stackoverflow_user = StackoverflowUser.new
    end

    context "username" do
      # Display Name can only contain letters, digits, spaces, apostrophes or hyphens and must start with a letter or digit
      # 30 characters max
      context "valid examples" do
        it "should be able profle contains letters, digits, spaces, aphostropes, hypens, ('_' allowed), and must start with letter or digit" do
          [
            "alpha' nume-ric 98_76",
            "4lp  haęął' nume-ric 98_76",
           ].each do |s|
             @stackoverflow_user.profile = s
             @stackoverflow_user.should be_valid
          end
        end
      end

      context "not valid" do
        it "should not be able profile contains characters like: \", =, ?, :, and not start with letter or digit" do
          ["funk\"drummer", "funky=", "funky?", ":funky", "funky!", "_dasdas", " dasd a", "-dasdas", "'dasdasd'"].each do |s|
            @stackoverflow_user.profile = s
            @stackoverflow_user.should_not be_valid
          end
        end
      end
    end

    context "link" do
      context "valid examples" do
        it "must be valid" do
          [
            "http://stackoverflow.com/users/1590134/john-coltrane",
            "http://stackoverflow.com/users/1590134/john_coltrane23"
          ].each do |s|
            @stackoverflow_user.profile = s
            @stackoverflow_user.should be_valid
          end
        end
      end

      context "not valid examples" do
        it "must not be valid" do
          [
            "http://stackoverflow.com/users/1590134/john_coltrane23!",
            "http://stackoverflow.com/users/1590134/óęśą23",
            "http://stackoverflow.com/users/1590134/jo hn",
            "http://stackoverflow.com/users/1590134/_john",
            "http://stackoverflow.com/users/1590134/-john",
            "http://stackoverflow.com/users/1590134/jo'hn"
          ].each do |s|
            @stackoverflow_user.profile = s
            @stackoverflow_user.should_not be_valid
          end
        end
      end
    end
  end

  describe "twitter" do
    before do
      @twitter_user = TwitterUser.new
    end

    context "entered only profile name" do
      # Only use letters, numbers and '_'
      # maximum 15 characters
      context "matching" do
        it "should be able profile contains letters, numbers and _" do
          ["funkydrummer", "funky_drummer", "FunkyDrumm3r87", "___", "4234234"].each do |s|
            @twitter_user.profile = s
            @twitter_user.should be_valid
          end
        end
      end

      context "not matching" do
        it "should not be able profile contains spaces, polish characters, special characters" do
          ["funk!", "fu nk", "fónk", "*funk", " funk" ].each do |s|
            @twitter_user.profile = s
            @twitter_user.should_not be_valid
          end
        end
      end
    end

    context "link" do
      context "valid" do
        it "should be able enter correct link" do
          [
            "https://twitter.com/funkydrummer",
            "http://twitter.com/funkydrummer",
            "https://www.twitter.com/funkydrummer",
            "http://www.twitter.com/funkydrummer",
            "www.twitter.com/funkydrummer",
            "twitter.com/funky___drummer",
            "twitter.com/funkydrummer23",
          ].each do |s|
            @twitter_user.profile = s
            @twitter_user.should be_valid
          end
        end
      end

      context "valid" do
        it "should not be able enter invalid link" do
          [
            "twitter.com/funkydrummer!",
            "twitter.com/drummer/2",
            "twitter.com//",
            "//drummer",
            "http:",
            "ww.drummer",
            "www.twitter.com/"
          ].each do |s|
            @twitter_user.profile = s
            @twitter_user.should_not be_valid
          end
        end
      end
    end
  end

  describe "user with type as string" do
    before do
      @user_with_type_as_string = UserWithTypeAsString.new
    end

    it "should be able type as string " do
      @user_with_type_as_string.profile = "!not_valid!"
      @user_with_type_as_string.should_not be_valid
    end
  end

  describe "user with type as symbol" do
    before do
      @user_with_type_as_symbol = UserWithTypeAsSymbol.new
    end

    it "should be able type as symbol" do
      @user_with_type_as_symbol.profile = "!not_valid!"
      @user_with_type_as_symbol.should_not be_valid
    end
  end

  describe "user with type as proc" do
    before do
      @user_with_type_as_proc = UserWithTypeAsProc.new
      @user_with_type_as_proc.kind = "github"
    end

    it "should be able type as proc" do
      @user_with_type_as_proc.profile = "!not_valid!"
      @user_with_type_as_proc.should_not be_valid
    end
  end

  context "with regular validator" do
    before do
      @user = User.new
    end

    it "should not allow nil as url" do
      @user.profile = nil
      @user.should_not be_valid
    end

    it "should not allow blank as url" do
      @user.profile = ""
      @user.should_not be_valid
    end
  end

  context "with allow nil" do
    before do
      @user = UserWithNil.new
    end

    it "should allow nil as profile" do
      @user.profile = nil
      @user.should be_valid
    end

    it "should not allow blank as profile" do
      @user.profile = ""
      @user.should_not be_valid
    end

    it "should allow a valid string" do
      @user.profile = "username"
      @user.should be_valid
    end
  end

  context "with allow blank" do
    before do
      @user = UserWithBlank.new
    end

    it "should allow nil as profile" do
      @user.profile = nil
      @user.should be_valid
    end

    it "should allow blank as profile" do
      @user.profile = ""
      @user.should be_valid
    end

    it "should allow a valid string" do
      @user.profile = "username"
      @user.should be_valid
    end
  end

  context "with legacy syntax" do
    before do
      @user = UserWithLegacySyntax.new
    end

    it "should allow nil as profile" do
      @user.profile = nil
      @user.should be_valid
    end

    it "should allow blank as profile" do
      @user.profile = ""
      @user.should be_valid
    end

    it "should allow a valid string" do
      @user.profile = "username"
      @user.should be_valid
    end

    it "should not allow invalid string" do
      @user.profile = "!+!@#"
      @user.should_not be_valid
    end
  end

  context "with ActiveRecord" do
    before do
      @user = UserWithAr.new
    end

    it "should not allow invalid profile" do
      @user.profile = "!@!$%"
      @user.should_not be_valid
    end
  end

  context "with ActiveRecord and legacy syntax" do
    before do
      @user = UserWithArLegacy.new
    end

    it "should not allow invalid string" do
      @user.profile = "!@$##"
      @user.should_not be_valid
    end
  end
end
