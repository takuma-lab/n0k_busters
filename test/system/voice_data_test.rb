require "application_system_test_case"

class VoiceDataTest < ApplicationSystemTestCase
  setup do
    @voice_datum = voice_data(:one)
  end

  test "visiting the index" do
    visit voice_data_url
    assert_selector "h1", text: "Voice Data"
  end

  test "creating a Voice datum" do
    visit voice_data_url
    click_on "New Voice Datum"

    fill_in "Id", with: @voice_datum.id
    fill_in "User", with: @voice_datum.user_id
    fill_in "Voice", with: @voice_datum.voice
    click_on "Create Voice datum"

    assert_text "Voice datum was successfully created"
    click_on "Back"
  end

  test "updating a Voice datum" do
    visit voice_data_url
    click_on "Edit", match: :first

    fill_in "Id", with: @voice_datum.id
    fill_in "User", with: @voice_datum.user_id
    fill_in "Voice", with: @voice_datum.voice
    click_on "Update Voice datum"

    assert_text "Voice datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Voice datum" do
    visit voice_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Voice datum was successfully destroyed"
  end
end
