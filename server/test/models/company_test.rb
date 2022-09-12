require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:one)
  end

  test 'valid company' do
    assert @company.valid?
  end

  test 'invalid without name' do
    @company.name = nil
    refute @company.valid?, 'Company is valid without a name'
    assert_not_empty @company.errors[:name], 'No validation error for name present'
  end

  test 'invalid without SIREN' do
    @company.siren = nil
    refute @company.valid?, 'Company is valid without a siren'
    assert_not_empty @company.errors[:siren], 'No validation error for siren present'
  end

  test 'SIREN is not proper lenght' do
    @company.siren = "012"
    refute @company.valid?, 'Company is valid with a wrong length of Siren'
    assert_not_empty @company.errors[:siren], 'No validation error for siren present'
  end

  test 'SIREN is not proper format' do
    @company.siren = "abcdefghi"
    refute @company.valid?, 'Company is valid with a wrong lenght of Siren'
    assert_not_empty @company.errors[:siren], 'No validation error for siren present'
  end
end
