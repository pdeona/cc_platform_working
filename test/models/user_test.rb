require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    email_str = (0..4).map{ |x| x = rand(0..9) }
    @u = User.new(
        username: "#{email_str.join}@deon.com",
        password: "password",
        password_confirmation: "password"
      )
  end

  test "it creates a User on .new" do
    assert_instance_of User, (User.new), "Object not an instance of User"
  end

  test "User has a .username method" do
    assert_respond_to (User.new), :username, "User has no .username method"
  end

  test "User has a .password method" do
    assert_respond_to (User.new), :password, "User has no .password method"
  end

  test "User validates :username presence" do
    @u.username = nil
    refute @u.save
  end

  test "User validates :password presence" do
    @u.password = nil
    refute @u.save
  end

  test "User has an encrypted password field with minimum 4 characters" do
    invalid_passwords = "too", "toolongheredontdothis", " "
    invalid_passwords.each do |invalid_password|
      @u.password = invalid_password
      refute @u.save
    end
  end

  test "User validates username format for valid email" do
    invalid_usernames = ["p@ddd", "@d.d", "pdpdpd", "pdpd.dp.dpdp"]
    invalid_usernames.each do |invalid_username|
      @u.username = invalid_username
      refute @u.save
    end
  end

  test "User rejects identical emails" do
    valid_user = User.create(username: "pedro@deona.com", password: "password", password_confirmation: "password")
    @u.username = "pedro@deona.com"
    refute @u.save
  end

  test "confirms password input" do
    @u.password_confirmation = nil
    refute @u.save, "User saved with invalid confirmation"
  end

  test "saves on valid password confirmation" do
    assert @u.save, "User save failed."
  end

end
