require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "trip duplication creates a new instance" do
    trips(:simple).duplicate
    assert_same(2, Trip.count)
  end
end
