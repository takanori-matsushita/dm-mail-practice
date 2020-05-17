require "application_system_test_case"

class DirectMailsTest < ApplicationSystemTestCase
  setup do
    @direct_mail = direct_mails(:one)
  end

  test "visiting the index" do
    visit direct_mails_url
    assert_selector "h1", text: "Direct Mails"
  end

  test "creating a Direct mail" do
    visit direct_mails_url
    click_on "New Direct Mail"

    fill_in "Content", with: @direct_mail.content
    fill_in "Title", with: @direct_mail.title
    click_on "Create Direct mail"

    assert_text "Direct mail was successfully created"
    click_on "Back"
  end

  test "updating a Direct mail" do
    visit direct_mails_url
    click_on "Edit", match: :first

    fill_in "Content", with: @direct_mail.content
    fill_in "Title", with: @direct_mail.title
    click_on "Update Direct mail"

    assert_text "Direct mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Direct mail" do
    visit direct_mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Direct mail was successfully destroyed"
  end
end
