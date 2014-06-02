require 'spec_helper'

describe User do
  before(:each) do
    @attr = { name: 'Example User', 
                   email: 'user@example.com' ,
                   password: 'foorbar',
                   password_confirmation: 'foobar'
        }
  end

  it 'should create a new instance if validates succeeds' do
  User.create!(@attr)
end

  it 'should require a name attribute' do
    no_name_user = User.new(@attr.merge(name: ''))
    no_name_user.should_not be_valid
  end

  it 'should require an email attribute' do
    no_email_user = User.new(@attr.merge(email: ''))
    no_email_user.should_not be_valid
  end

  it 'should not have too long name' do
    long_name = 'a' * 51
    long_name_user = User.new(@attr.merge(name: long_name))
    long_name_user.should_not be_valid
  end

  it 'should accept valid email addresses' do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(email: address))
      valid_email_user.should be_valid
    end
  end

  it 'should reject invalid email addresses' do
    addresses = %w[user@foo,com THE_USER_at_foo.bar.org first.last@foo.jp.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(email: address))
      invalid_email_user.should_not be_valid
    end
  end

  it 'should reject duplicate email addresses' do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it 'should reject identical email addresses with different case' do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(email: upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe 'passwords' do
    before (:each) do
      @user = User.new(@attr)
    end
    
    it 'should have a password attribute' do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:passowrd_confirmation)
    end
  end

  describe 'password validation' do
    it 'should require a password' do
      User.new(@attr.merge(password: '', password_confirmation: '')).
        should_not respond_to(:password)
    end

    it 'should require a matching password confirmation' do
      User.new(@attr.merge(password_confirmation: 'invalid')).should_not be_valid
    end
  end
end
