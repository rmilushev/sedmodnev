require 'test_helper'

class AuthorProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_profile = author_profiles(:one)
  end

  test "should get index" do
    get author_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_author_profile_url
    assert_response :success
  end

  test "should create author_profile" do
    assert_difference('AuthorProfile.count') do
      post author_profiles_url, params: { author_profile: { admin_id: @author_profile.admin_id, description: @author_profile.description, enabled: @author_profile.enabled, image: @author_profile.image, name: @author_profile.name } }
    end

    assert_redirected_to author_profile_url(AuthorProfile.last)
  end

  test "should show author_profile" do
    get author_profile_url(@author_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_profile_url(@author_profile)
    assert_response :success
  end

  test "should update author_profile" do
    patch author_profile_url(@author_profile), params: { author_profile: { admin_id: @author_profile.admin_id, description: @author_profile.description, enabled: @author_profile.enabled, image: @author_profile.image, name: @author_profile.name } }
    assert_redirected_to author_profile_url(@author_profile)
  end

  test "should destroy author_profile" do
    assert_difference('AuthorProfile.count', -1) do
      delete author_profile_url(@author_profile)
    end

    assert_redirected_to author_profiles_url
  end
end
