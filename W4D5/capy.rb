Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 @TheLastSultan Sign out
 The password you provided has been reported as compromised due to re-use of that password on another service by you or someone else. GitHub has not been compromised directly. To increase your security, please change your password as soon as possible.

Read our documentation on safer password practices. See our blog for more details.

43
315 995 appacademy/curriculum Private
 Code  Issues 14  Pull requests 8  Projects 0  Wiki  Insights
curriculum/rails/projects/music_app/solution/spec/models/user_spec.rb
2c66a96  on Oct 30, 2017
@niartenyaw niartenyaw Add non-gem instances of factory-bot
@niartenyaw @mikeboan
    
60 lines (47 sloc)  1.58 KB
require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      # Miniscule chance this will fail.
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end
end
© 2018 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
Press h to open a hovercard with more details.
