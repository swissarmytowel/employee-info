require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @test_user_instance = User.new(name: "John Doe", email: "jdoe@gmail.com", 
      password: "a" * 7, password_confirmation: "a" * 7)
  end

  test "Initial instance should be valid" do
      assert @test_user_instance.valid?
   end

  test "Name field should be present" do
     @test_user_instance.name = ""
     assert_not @test_user_instance.valid?
   end

  test "Email should be present" do
      @test_user_instance.email = ""
      assert_not @test_user_instance.valid?
  end

  test "Name length should be less than 50 chars" do
    @test_user_instance.name = "John" * 50
    assert_not @test_user_instance.valid?
  end
  
  test "Email length should be less than 80 chars" do
    @test_user_instance.email = "a" * 80 + "@test.info"
    assert_not @test_user_instance.valid?
  end

  test "Email should be of right format" do
    @test_user_instance.email = "test.com"
    assert_not @test_user_instance.valid?
  end

  test "Email should be unique" do
    duplicate = @test_user_instance.dup
    @test_user_instance.save
    assert_not duplicate.valid? 
  end

  test "Emails should be saved in lowercase" do
    mixed_case_email = "TeStemail@GmaIl.COM"
    @test_user_instance.email = mixed_case_email
    @test_user_instance.save
    assert_equal mixed_case_email.downcase, @test_user_instance.reload.email
  end
end
