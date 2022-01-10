require "application_system_test_case"

class AuthorProfilesTest < ApplicationSystemTestCase
  setup do
    @author_profile = author_profiles(:one)
  end

  test "visiting the index" do
    visit author_profiles_url
    assert_selector "h1", text: "Author Profiles"
  end

  test "creating a Author profile" do
    visit author_profiles_url
    click_on "New Author Profile"

    fill_in "Admin", with: @author_profile.admin_id
    fill_in "Description", with: @author_profile.description
    check "Enabled" if @author_profile.enabled
    fill_in "Image", with: @author_profile.image
    fill_in "Name", with: @author_profile.name
    click_on "Create Author profile"

    assert_text "Author profile was successfully created"
    click_on "Back"
  end

  test "updating a Author profile" do
    visit author_profiles_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @author_profile.admin_id
    fill_in "Description", with: @author_profile.description
    check "Enabled" if @author_profile.enabled
    fill_in "Image", with: @author_profile.image
    fill_in "Name", with: @author_profile.name
    click_on "Update Author profile"

    assert_text "Author profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Author profile" do
    visit author_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author profile was successfully destroyed"
  end
end
