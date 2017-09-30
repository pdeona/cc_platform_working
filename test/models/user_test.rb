require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it creates a User on .new" do
    u = User.new
    assert_instance_of User, u, "Object not an instance of User"
  end

  test "User has a .username method" do
    u = User.new
    assert_respond_to u, :username, "User has no .username method"
  end

  test ""
end
