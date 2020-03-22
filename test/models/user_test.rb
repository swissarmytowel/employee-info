require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "John Doe", email: "jdoe@gmail.com", 
    password: "aaaaa", password_confirmation: "aaaaa")
  end

  test "Initial instance should be valid" do
      assert @user.valid?
   end

  test "Name field should be present" do
     @user.name = ""
     assert_not @user.valid?
   end

  test "Email should be present" do
      @user.email = ""
      assert_not @user.valid?
  end

  test "Name length should be less than 50 chars" do
    @user.name = "John" * 50
    assert_not @user.valid?
  end
  
  test "Email length should be less than 80 chars" do
    @user.email = "a" * 80 + "@test.info"
    assert_not @user.valid?
  end

  test "Email should be of right format" do
    @user.email = "test.com"
    assert_not @user.valid?
  end

  test "Email should be unique" do
    duplicate = @user.dup
    @user.save
    assert_not duplicate.valid? 
  end

  test "Emails should be saved in lowercase" do
    mixed_case_email = "TeStemail@GmaIl.COM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
