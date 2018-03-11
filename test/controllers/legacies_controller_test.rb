require 'test_helper'

class LegaciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legacy = legacies(:one)
  end

  test "should get index" do
    get legacies_url
    assert_response :success
  end

  test "should get new" do
    get new_legacy_url
    assert_response :success
  end

  test "should create legacy" do
    assert_difference('Legacy.count') do
      post legacies_url, params: { legacy: { about: @legacy.about, age: @legacy.age, born_on: @legacy.born_on, city: @legacy.city, country: @legacy.country, county: @legacy.county, name: @legacy.name, passed_on: @legacy.passed_on, state: @legacy.state } }
    end

    assert_redirected_to legacy_url(Legacy.last)
  end

  test "should show legacy" do
    get legacy_url(@legacy)
    assert_response :success
  end

  test "should get edit" do
    get edit_legacy_url(@legacy)
    assert_response :success
  end

  test "should update legacy" do
    patch legacy_url(@legacy), params: { legacy: { about: @legacy.about, age: @legacy.age, born_on: @legacy.born_on, city: @legacy.city, country: @legacy.country, county: @legacy.county, name: @legacy.name, passed_on: @legacy.passed_on, state: @legacy.state } }
    assert_redirected_to legacy_url(@legacy)
  end

  test "should destroy legacy" do
    assert_difference('Legacy.count', -1) do
      delete legacy_url(@legacy)
    end

    assert_redirected_to legacies_url
  end
end
