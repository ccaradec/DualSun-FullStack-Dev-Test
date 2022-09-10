require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:valid)
  end

  test 'valid customer' do
    assert @customer.valid?
  end

  test 'invalid without first name' do
    @customer.fname = nil
    refute @customer.valid?, 'Customer is valid without a first name'
    assert_not_empty @customer.errors[:fname], 'No validation error for first name present'
  end

  test 'invalid without last name' do
    @customer.lname = nil
    refute @customer.valid?, 'Customer is valid without a last name'
    assert_not_empty @customer.errors[:lname], 'No validation error for last name present'
  end

  test 'invalid without proper mail' do
    @customer.email = "wrongmail"
    refute @customer.valid?, 'Customer is valid without a proper email'
    assert_not_empty @customer.errors[:email], 'No validation error for valid email'
  end

  test 'invalid without proper phone number' do
    @customer.phone = "wrongphone"
    refute @customer.valid?, 'Customer is valid without a proper phone'
    assert_not_empty @customer.errors[:phone], 'No validation error for valid phone'
  end
end
