require 'test_helper'

class DirectMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direct_mail = direct_mails(:one)
  end

  test "should get index" do
    get direct_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_direct_mail_url
    assert_response :success
  end

  test "should create direct_mail" do
    assert_difference('DirectMail.count') do
      post direct_mails_url, params: { direct_mail: { content: @direct_mail.content, title: @direct_mail.title } }
    end

    assert_redirected_to direct_mail_url(DirectMail.last)
  end

  test "should show direct_mail" do
    get direct_mail_url(@direct_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_direct_mail_url(@direct_mail)
    assert_response :success
  end

  test "should update direct_mail" do
    patch direct_mail_url(@direct_mail), params: { direct_mail: { content: @direct_mail.content, title: @direct_mail.title } }
    assert_redirected_to direct_mail_url(@direct_mail)
  end

  test "should destroy direct_mail" do
    assert_difference('DirectMail.count', -1) do
      delete direct_mail_url(@direct_mail)
    end

    assert_redirected_to direct_mails_url
  end
end
