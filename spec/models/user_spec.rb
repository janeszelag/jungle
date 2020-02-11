require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: "Cat", last_name: "Dog", email: "example@example.com", password: "wow1wow", password_confirmation: "wow1wow")
    end
  
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid when password and confirmation do not match" do
      @user.password_confirmation = 'aaaaaaaa'
      expect(@user).to_not be_valid
    end

    it "is not valid when first_name is empty" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when last_name is empty" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when email is empty" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when password is empty" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when password_confirmation is empty" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "is not valid if email is not is not unique, case doesn't matter" do
      @user.save
      @newUser = User.new(first_name: "Cow", last_name: "Mouse", email: "exaMPLE@example.com", password: "wow1wow", password_confirmation: "wow1wow")
      @newUser.save
      expect(@newUser).to_not be_valid
    end

    it "is not valid if password is less than 6 characters" do
      @user.password = 'wow'
    end


  end
  
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(id: 1, first_name: "Carly", last_name: "Hunt", email: 'carly.hunt@outlook.ca', password: 'little123', password_confirmation: 'little123')
    end

    it "is valid with correct login information" do
      @email = "carly.hunt@outlook.ca"
      @password = "little123"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@user[:email]).to eq(@logged_user[:email])
    end

    it "is valid with spaces in email" do
      @email = " carly.hunt@outlook.ca "
      @password = "little123"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@user[:email]).to eq(@logged_user[:email])
    end

    it "is not valid with incorrect password" do
      @email = "carly.hunt@outlook.ca"
      @password = "little"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@logged_user).to eq(nil)
    end

    it "is not valid with incorrect email" do
      @email = "carlhunt@outlook.ca"
      @password = "little123"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@logged_user).to eq(nil)
    end
  end



end
