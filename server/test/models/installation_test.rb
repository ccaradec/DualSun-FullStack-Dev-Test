require "test_helper"

class InstallationTest < ActiveSupport::TestCase
  def setup
    @installation = installations(:one)
  end

  test 'valid installation' do
    assert @installation.valid?
  end

  test 'invalid without street' do
    @installation.street = nil
    refute @installation.valid?, 'Installation is valid without a street'
    assert_not_empty @installation.errors[:street], 'No validation error for street present'
  end
  
  test 'invalid without city' do
    @installation.city = nil
    refute @installation.valid?, 'Installation is valid without a city'
    assert_not_empty @installation.errors[:city], 'No validation error for city present'
  end

  test 'invalid without zipcode' do
    @installation.zipcode = nil
    refute @installation.valid?, 'Installation is valid without a zipcode'
    assert_not_empty @installation.errors[:zipcode], 'No validation error for zipcode present'
  end

  test 'invalid without country' do
    @installation.country = nil
    refute @installation.valid?, 'Installation is valid without a country'
    assert_not_empty @installation.errors[:country], 'No validation error for country present'
  end

  test 'invalid without valid customer' do
    @installation.customer = nil
    refute @installation.valid?, 'Installation is valid without a customer'
    assert_not_empty @installation.errors[:customer], 'No validation error for customer present'
  end

  test 'invalid without valid company' do
    @installation.company = nil
    refute @installation.valid?, 'Installation is valid without a company'
    assert_not_empty @installation.errors[:company], 'No validation error for company present'
  end
end
