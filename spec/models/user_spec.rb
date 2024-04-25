require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a user' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user).to be_valid
    end

    it 'should not create a user wit different password and password_confirmation' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password1')
      expect(@user).to_not be_valid
    end

    it 'should not create a user with different email case' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      @user2 = User.new(first_name: 'John', last_name: 'Doe', email: 'EXAMPLE@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user2).to_not be_valid
    end

    it 'should not create a user without first_name' do
      @user = User.new(first_name: nil, last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it 'should not create a user without last_name' do
      @user = User.new(first_name: 'John', last_name: nil, email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it 'should not create a user without email' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: nil, password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it 'should not create a user without password' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: nil, password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it 'should not create a user without password_confirmation' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it 'should not create a user with password less than 6 characters' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'pass', password_confirmation: 'pass')
      expect(@user).to_not be_valid
    end

    it 'should authenticate user with credentials' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(User.authenticate_with_credentials('example@gmail.com', 'password')).to eq(@user)
    end

    it 'should not authenticate user with wrong email' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(User.authenticate_with_credentials('example@gmail.com', 'password')).to eq(@user)
    end

    it 'should not authenticate user with wrong password' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(User.authenticate_with_credentials('example@gmail.com', 'password1')).to_not eq(@user)
    end

    it 'should authenticate user with email with spaces' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(User.authenticate_with_credentials('  example@gmail.com  ', 'password')).to eq(@user)
    end

    it 'should authenticate user with email with different case' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(User.authenticate_with_credentials('Example@gmail.com', 'password')).to eq(@user)
    end

  end
end