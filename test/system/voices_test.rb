require "application_system_test_case"

class VoicesTest < ApplicationSystemTestCase
  setup do
    @voice = voices(:one)
  end

  test "visiting the index" do
    visit voices_url
    assert_selector "h1", text: "Voices"
  end

  test "creating a Voice" do
    visit voices_url
    click_on "New Voice"

    fill_in "User", with: @voice.user_id
    fill_in "Voice", with: @voice.voice
    click_on "Create Voice"

    assert_text "Voice was successfully created"
    click_on "Back"
  end

  test "updating a Voice" do
    visit voices_url
    click_on "Edit", match: :first

    fill_in "User", with: @voice.user_id
    fill_in "Voice", with: @voice.voice
    click_on "Update Voice"

    assert_text "Voice was successfully updated"
    click_on "Back"
  end

  test "destroying a Voice" do
    visit voices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Voice was successfully destroyed"
  end
end
