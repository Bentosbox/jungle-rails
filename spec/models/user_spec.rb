require 'rails_helper'

RSpec.describe User, type: :model do

# PASSWORD STUFF

  context "Match passwords" do
    it "should be the same passwords" do
      @user = User.new(
        first_name: "Ash",
        last_name: "Ketchum",
        password: "123",
        password_confirmation: "123"
        )
      expect(@user[:password]).to eq(@user[:password_confirmation])
    end

  context "Password minimum length and present" do
    it "should not be valid if password length is shorter than 3" do
    @user = User.create(
      first_name: "Prof",
      last_name: "Oak",
      email: "test@test",
      password: "12",
      password_confirmation: "12"
      )
    expect(@user).to_not be_valid
    end
  end

    it "should not be valid if missing pwd or confirm of pwd" do
      @user = User.new(
        first_name: "Gary",
        last_name: "Oak",
        password: "123"
        )
      expect(@user).to_not be_valid
    end
  end

  context "case sensitive email" do
    it "should be case insensitive" do
      @user1 = User.create(
        first_name: "Ash",
        last_name: "Ketchum",
        email: "test@test.test",
        password: "111",
        password_confirmation: "111"
        )
      @user2 = User.create(
        first_name: "Ash",
        last_name: "Ketchum",
        email: "tEst@teSt.tesT",
        password: "111",
        password_confirmation: "111"
        )
      expect(@user2).to_not be_valid
    end
  end

  context "first and last name present" do
    it "should not be valid when I miss last name" do
      @user = User.create(
        first_name: "first_name",
        email: "test@test",
        password: "111",
        password_confirmation: "111"
        )
      expect(@user).to_not be_valid
    end
    it "should not be valid when I miss first name" do
      @user = User.create(
        last_name: "ImOutOfIdeas",
        email: "test@test",
        password: "111",
        password_confirmation: "111")

    end
  end


  describe ".authenticate_with_credentials" do
    before :each do
      @user = User.create(
        first_name: "HowDisWork",
        last_name: "last_name",
        email: "test@test",
        password: "111",
        password_confirmation: "111"
        )
    end

    it "should login when email and password are correct" do
      user = User.authenticate_with_credentials("test@test", "111")
      expect(user).to be_instance_of(User)
    end

    it "should not logged in when the input email does not match" do
      user = User.authenticate_with_credentials("test@asdf", "111")
      expect(user).to be_nil
    end
    it "should not logged in when the input pwd don't match" do
      user = User.authenticate_with_credentials("test@test", "asdf")
      expect(user).to be_nil
    end

    it "should log in even mix upper and lower case in email in email field" do
      @user = User.authenticate_with_credentials("test@TEST.com", "12345")
      expect(@user).to be_instance_of(User)
    end
  end
end
