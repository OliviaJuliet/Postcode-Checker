require "test_helper"

class LsoaTest < ActiveSupport::TestCase
  test "check returns true for in-lsoa postcode" do
    assert Lsoa.check("SE17QD")
  end

  test "check returns false for out-of-lsoa postcode" do
    assert_not Lsoa.check("HA29DZ")
  end

  test "check returns false for non-existent postcode" do
    assert_not Lsoa.check("JUSTSOMETEXT")
  end
end
