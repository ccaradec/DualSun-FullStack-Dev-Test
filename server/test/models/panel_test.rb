require "test_helper"

class PanelTest < ActiveSupport::TestCase
  def setup
    @panel = panels(:one)
  end

  test 'invalid without proper ID' do
    @panel.panel_id = "12"
    refute @panel.valid?, 'Panel is valid with an incorrect ID'
    assert_not_empty @panel.errors[:panel_id], 'No validation error for incorrect ID present'
  end

  test 'invalid without proper type' do
    @panel.panel_type = nil
    refute @panel.valid?, 'Panel is valid without a type'
    assert_not_empty @panel.errors[:panel_type], 'No validation error for no type present'
  end
end
