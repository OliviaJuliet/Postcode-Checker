require "test_helper"

class ServedPostcodesControllerTest < ActionDispatch::IntegrationTest
  test "check displays confirmation for in-lsoa postcode" do
    get "/check", params: { query: "SE17QD" }
    assert_select "p", /within/
  end

  test "check displays confirmation for served out-of-lsoa postcode" do
    get "/check", params: { query: "SH241AA" }
    assert_select "p", /within/
  end

  test "check displays denial for non-served postcode" do
    get "/check", params: { query: "HA29DZ" }
    assert_select "p", /outside/
  end

  test "check displays denial for non-existent postcode" do
    get "/check", params: { query: "Not even close" }
    assert_select "p", /outside/
  end

  test "check displays confirmation for unformatted served postcode" do
    get "/check", params: { query: "Se1 7qD" }
    assert_select "p", /within/
  end
end
