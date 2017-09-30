require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @u = User.new
  end

  test "it creates a User on .new" do
    assert_instance_of User, @u, "Object not an instance of User"
  end

  test "User has a .username method" do
    assert_respond_to @u, :username, "User has no .username method"
  end

  test "User has a .password method" do
    assert_respond_to @u, :password, "User has no .password method"
  end

  test "User validates :username field" do
    refute @u.save
  end

  test "User has an encrypted password field with minimum 4 characters" do
    invalid_passwords = "too", "toolongheredontdothis", " "
    invalid_passwords.each do |invalid_password|
      @u.password = invalid_password
      refute @u.save
    end
  end

end
