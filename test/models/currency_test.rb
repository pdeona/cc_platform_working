require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

  def setup
    @c = Currency.new
  end

  test "it creates a Currency on Currency.new" do
    assert_instance_of Currency, @c, "Object not an instance of Currency"
  end

end
