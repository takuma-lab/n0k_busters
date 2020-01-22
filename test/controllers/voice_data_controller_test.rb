require 'test_helper'

class VoiceDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voice_datum = voice_data(:one)
  end

  test "should get index" do
    get voice_data_url
    assert_response :success
  end

  test "should get new" do
    get new_voice_datum_url
    assert_response :success
  end

  test "should create voice_datum" do
    assert_difference('VoiceDatum.count') do
      post voice_data_url, params: { voice_datum: { id: @voice_datum.id, user_id: @voice_datum.user_id, voice: @voice_datum.voice } }
    end

    assert_redirected_to voice_datum_url(VoiceDatum.last)
  end

  test "should show voice_datum" do
    get voice_datum_url(@voice_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_voice_datum_url(@voice_datum)
    assert_response :success
  end

  test "should update voice_datum" do
    patch voice_datum_url(@voice_datum), params: { voice_datum: { id: @voice_datum.id, user_id: @voice_datum.user_id, voice: @voice_datum.voice } }
    assert_redirected_to voice_datum_url(@voice_datum)
  end

  test "should destroy voice_datum" do
    assert_difference('VoiceDatum.count', -1) do
      delete voice_datum_url(@voice_datum)
    end

    assert_redirected_to voice_data_url
  end
end
