require 'test_helper'

class ActTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Act.new.valid?
  end
end
