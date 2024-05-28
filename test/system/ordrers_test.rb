require "application_system_test_case"

class OrdrersTest < ApplicationSystemTestCase
  setup do
    @ordrer = ordrers(:one)
  end

  test "visiting the index" do
    visit ordrers_url
    assert_selector "h1", text: "Ordrers"
  end

  test "should create ordrer" do
    visit ordrers_url
    click_on "New ordrer"

    click_on "Create Ordrer"

    assert_text "Ordrer was successfully created"
    click_on "Back"
  end

  test "should update Ordrer" do
    visit ordrer_url(@ordrer)
    click_on "Edit this ordrer", match: :first

    click_on "Update Ordrer"

    assert_text "Ordrer was successfully updated"
    click_on "Back"
  end

  test "should destroy Ordrer" do
    visit ordrer_url(@ordrer)
    click_on "Destroy this ordrer", match: :first

    assert_text "Ordrer was successfully destroyed"
  end
end
