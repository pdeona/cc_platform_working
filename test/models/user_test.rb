require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @u = User.new(username: "123@se.com")
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

  test "User validates :username presence" do
    @u.password = "validpass"
    refute @u.save
  end

  test "User validates :password presence" do
    @u.username = "p@d.com"
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
    valid_user = User.create(username: "pedro@deona.com")
    @u.username = "pedro@deona.com"
    refute @u.save
  end

  test "Accepts valid email strings" do
    email_str = (0..4).map{ |x| x = rand(0..9) }
    valid_user = User.new(username: "#{email_str.join}@deon.com", password: "tested", password_confirmation: "tested")
    assert valid_user.save, "User was not saved successfully."
  end

  test "Rejects invalid password confirmation" do
    @u.password = "password"
    @u.password_confirmation = "invalid"
    refute @u.save, "User saved without valid confirmation"
  end

  test "Saves with valid password confirmation" do
    @u.password = "password"
    @u.password_confirmation = "password"
    assert @u.save, "User was not saved successfully"
  end

end
