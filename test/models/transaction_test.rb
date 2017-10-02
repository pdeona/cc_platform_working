require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @p = Position.new
    @t = Transaction.new(
              date: "1999/12/19",
              exchanged_currency: "BTC",
              underlying_currency: "USD",
              position: @p
    )
  end

  test "it creates a Transaction on .new" do
    assert_instance_of Transaction, @t, "Object not an instance of Transaction"
  end

  test "Transaction has a .date method" do
    assert_respond_to @t, :date, "Transaction has no .date method"
  end

  test "Transaction has a .position_taken method" do
    assert_respond_to @t, :position_taken, "Transaction has no .position_taken method"
  end

  test "Transaction has a .underlying_currency method" do
    assert_respond_to @t, :underlying_currency, "Transaction has no .underlying_currency method"
  end

  test "Transaction has a .exchanged_currency method" do
    assert_respond_to @t, :exchanged_currency, "Transaction has no .exchanged_currency method"
  end

  test "Transaction has a .position getter method" do
    assert_respond_to @t, :position, "Transaction has no .position method"
  end

  test "Transaction has a .position setter method" do
    assert_respond_to @t, :position=, "Transaction has no .position= method"
  end

  test "Transaction validates position_id" do
    @t.position = nil
    refute @t.save, "Transaction was saved without a position_id"
  end

  test "Transaction saves with valid position_id" do
    assert @t.save, "Transaction was unable to save"
  end

  test "The date attribute only accepts accepted formats" do
    @t.date = 'invalid'
    refute @t.save, "transaction was saved with invalid date"
  end

  test "The exchanged_currency attribute validates symbol length" do
    @t.exchanged_currency = "invalid"
    refute @t.save, "Transaction was saved with invalid exchanged_currency lenth"
  end

  test "The underlying_currency attribute validates symbol length" do
    @t.underlying_currency = "invalid"
    refute @t.save, "Transaction was saved with invalid underlying_currency length"
  end

  test "The exchanged_currency attribute validates symbol as existing currency" do
    @t.exchanged_currency = "123"
    refute @t.save, "Transaction saved with invalid exchanged_currency symbol"
  end

  test "The underlying_currency attribute validates symbol as existing currency" do
    @t.underlying_currency = "123"
    refute @t.save, "Trnasaction saved with invalid exchanged_currency symbol"
  end
end
